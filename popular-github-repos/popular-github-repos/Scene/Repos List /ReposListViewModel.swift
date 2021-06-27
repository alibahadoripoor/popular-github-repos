//
//  ReposListViewModel.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

enum FetchingType {
    case firstLoad, refresh, nextPage
}

final class ReposListViewModel{
    
    // MARK: - Variables
    
    private var webService: ReposWebServiceProtocol
    private var repos: [Repository] = []
    private var nextPage = 1
    private var pageCount: Int = 1
    private var isFetchInProgress: Bool = false
    var onFetchCompleted: (FetchingType)->() = { _ in }
    var onFetchingInProgress: (FetchingType)->() = { _ in }
    var onFetchFailed: (String, String)->() = { _,_ in }
    
    // MARK: - Initialization
    
    init(webService: ReposWebServiceProtocol = GithubWebService()) {
        self.webService = webService
    }
    
    // MARK: - View Functions
    
    func viewDidLoad(){
        fetchCells(type: .firstLoad)
    }
    
    func viewDidRefresh(){
        fetchCells(type: .refresh)
    }
    
    func viewDidScrollToBottom(){
        fetchCells(type: .nextPage)
    }
    
    func cellNumber() -> Int {
        return repos.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> RepoCellViewModel{
        return RepoCellViewModel(repo: repos[indexPath.item])
    }
    
    //MARK: - Private Functions
    
    private func setPageCount(for totalCount: Int){
        let count: Double = Double(totalCount / 30)
        self.pageCount = Int(ceil(count))
    }
    
    private func fetchCells(type: FetchingType){
        guard isFetchInProgress == false else {
            return
        }
        
        if type == .firstLoad || type == .refresh {
            nextPage = 1
        }
        
        guard nextPage <= pageCount else {
            return
        }
        
        onFetchingInProgress(type)
        isFetchInProgress = true
        
        webService.fetchRepos(for: nextPage) { [weak self] result in
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
                
            case .success(let reposObject):
                if type == .firstLoad || type == .refresh{
                    self.repos = reposObject.repos
                    self.setPageCount(for: reposObject.totalCount)
                }else{
                    self.repos.append(contentsOf: reposObject.repos)
                }
                self.nextPage += 1
                self.onFetchCompleted(type)
                self.isFetchInProgress = false
            }
        }
    }
}
