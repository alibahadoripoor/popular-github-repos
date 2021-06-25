//
//  GithubWebService.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

typealias ReposCompletion = (RepositoryResponse?, GithubWebServiceError?) -> ()

protocol ReposWebServiceProtocol {
    func fetchRepos(completion: @escaping ReposCompletion)
}

final class GithubWebService {
    private var dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol = DataService()) {
        self.dataService = dataService
    }
}

extension GithubWebService: ReposWebServiceProtocol {
    
    func fetchRepos(completion: @escaping ReposCompletion) {
        fetchData(for: .repos, completion: completion)
    }
    
    private func fetchData<T>(for endPoint: GithubWebServiceEndpoint, completion: @escaping (T?, GithubWebServiceError?) -> ()) where T: Decodable {
        
        guard let url = endPoint.url else {
            completion(nil, .network(description: "Couldn't create URL"))
            return
        }
        
        dataService.fetchData(for: url) { (data, error) in
            
            guard error == nil else{
                completion(nil, error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let object: T = try decoder.decode(T.self, from: data!)
                completion(object, nil)
            } catch {
                debugPrint("Unable to decode data: \(error.localizedDescription)")
                completion(nil, .parsing(description: "Unable to decode data: \(error.localizedDescription)"))
            }
        }
    }
}

