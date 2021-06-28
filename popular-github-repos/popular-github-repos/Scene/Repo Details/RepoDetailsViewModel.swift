//
//  RepoDetailsViewModel.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 27.06.21.
//

import Foundation

final class RepoDetailsViewModel{
    
    // MARK: - Variables
    
    private var webService: RepoWebServiceProtocol
    private var repo: Repository!
    private var timer: Timer!
    private var isFetchInProgress: Bool = false
    var onFetchCompleted: ()->() = {}
    var onFetchFailed: (String, String)->() = { _,_ in }
    
    // MARK: - Initialization
    
    init(webService: RepoWebServiceProtocol = GithubWebService(), repo: Repository) {
        self.webService = webService
        self.repo = repo
    }
    
    // MARK: - View Functions
    
    func viewDidLoad(){
        onFetchCompleted()
        timer = Timer.scheduledTimer(timeInterval: 10.0,
                                 target: self,
                                 selector: #selector(fetchRepo),
                                 userInfo: nil,
                                 repeats: true)
    }
    
    func viewDidDisappear(){
        webService.cancel()
        timer.invalidate()
    }
    
    func headerViewModel() -> RepoDetailsHeaderViewModel{
        return RepoDetailsHeaderViewModel(repo: repo)
    }
    
    //MARK: - Private Functions
    
    @objc private func fetchRepo() {
        if isFetchInProgress {
            webService.cancel()
        }
        
        isFetchInProgress = true
        
        webService.fetchRepo(ownerName: repo.owner.name, repoName: repo.name) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result{
            
            case .failure(let error):
                switch error{
                case .network:
                    self.onFetchFailed("Network Error", error.des)
                case .parsing:
                    self.onFetchFailed("Parsing Error", error.des)
                }
                self.isFetchInProgress = false
                
            case .success(let repo):
                self.repo = repo
                self.onFetchCompleted()
                self.isFetchInProgress = false
            }

        }
    }
}
