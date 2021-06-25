//
//  ReposListViewModel.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

final class ReposListViewModel{
    private var webService: ReposWebServiceProtocol
    private var repos: [Repository] = []
    private var totalReposCount: Int = 0
    var onUpdate: () -> () = {}
    var onShowAlert: (String, String) -> () = { _,_ in }
    
    init(webService: ReposWebServiceProtocol = GithubWebService()) {
        self.webService = webService
    }
    
    func viewDidLoad(){
        webService.fetchRepos { [weak self] reposObject, error in
            guard let self = self else { return }
            
            guard error == nil else {
                switch error{
                case .network(let des):
                    self.onShowAlert("Network Error", des)
                case .parsing(let des):
                    self.onShowAlert("Parsing Error", des)
                default:
                    break
                }
                return
            }
            
            guard let reposObject = reposObject else { return }
            self.repos = reposObject.repos
            self.totalReposCount = reposObject.totalCount
            self.onUpdate()
        }
    }
    
    func cellNumber() -> Int {
        return repos.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> RepoCellViewModel{
        return RepoCellViewModel(repo: repos[indexPath.item])
    }
}
