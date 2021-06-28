//
//  RepoDataServiceMock.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import XCTest
@testable import popular_github_repos

class RepoDataServiceMock: DataServiceProtocol {
    func fetchData(for url: URL, completion: @escaping fetchDataCompletion) {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "RepoResponseMock", withExtension: "json")!
        
        do{
            completion(Result.success( try Data(contentsOf: url)))
        }catch{
            completion(Result.failure(.network(description: "NETWORK ERROR")))
        }
    }
    
    func cancel() {
        
    }
}
