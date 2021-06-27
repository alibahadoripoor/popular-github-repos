//
//  GithubWebService.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

typealias ReposCompletion = (Result<RepositoryResponse, HTTPError>) -> Void

protocol ReposWebServiceProtocol {
    func fetchRepos(for page: Int, completion: @escaping ReposCompletion)
}

final class GithubWebService {
    private var dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol = DataService()) {
        self.dataService = dataService
    }
}

extension GithubWebService: ReposWebServiceProtocol {
    
    func fetchRepos(for page: Int, completion: @escaping ReposCompletion) {
        fetchData(for: .repos(page: page), completion: completion)
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

