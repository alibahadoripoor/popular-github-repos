//
//  GithubWebService.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

typealias RepoListCompletion = (Result<RepositoryResponse, HTTPError>) -> Void
typealias RepoCompletion = (Result<Repository, HTTPError>) -> Void

protocol RepoListWebServiceProtocol {
    func fetchRepos(for page: Int, completion: @escaping RepoListCompletion)
}

protocol RepoWebServiceProtocol {
    func fetchRepo(ownerName: String, repoName: String, completion: @escaping RepoCompletion)
    func cancel()
}

final class GithubWebService {
    private var dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol = DataService()) {
        self.dataService = dataService
    }
    
    private func fetchData<T>(for endPoint: GithubEndpoint, completion: @escaping (Result<T, HTTPError>) -> Void) where T: Decodable {
        
        guard let url = endPoint.url else {
            completion(.failure(.network(description: "creating URL is not possible")))
            return
        }
        
        dataService.fetchData(for: url) { result in
            switch result{
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let object: T = try decoder.decode(T.self, from: data)
                    completion(.success(object))
                } catch let error {
                    completion(.failure(.parsing(description: error.localizedDescription)))
                }
            }
        }
    }
}

extension GithubWebService: RepoListWebServiceProtocol {
    func fetchRepos(for page: Int, completion: @escaping RepoListCompletion) {
        fetchData(for: .repoList(page: page), completion: completion)
    }
}

extension GithubWebService: RepoWebServiceProtocol {
    func fetchRepo(ownerName: String, repoName: String, completion: @escaping RepoCompletion) {
        fetchData(for: .repo(ownerName: ownerName, repoName: repoName), completion: completion)
    }
    
    func cancel() {
        dataService.cancel()
    }
}
