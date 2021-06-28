//
//  DataService.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

typealias fetchDataCompletion = (Data?, HTTPError?) -> ()

protocol DataServiceProtocol {
    func fetchData(for url: URL, completion: @escaping (Result<Data, HTTPError>) -> Void)
    func cancel()
}

final class DataService: DataServiceProtocol{
    private let session: URLSession = .shared
    private var task: URLSessionDataTask?
    
    func fetchData(for url: URL, completion: @escaping (Result<Data, HTTPError>) -> Void){
        
        task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                guard error == nil else {
                    completion(Result.failure(.network(description: error!.localizedDescription)))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.hasSuccessStatusCode,
                  let data = data else {
                    completion(Result.failure(.network(description: "failure response")))
                    return
                }
                
                completion(Result.success(data))
            }
        }
        task?.resume()
    }
    
    func cancel(){
        task?.cancel()
    }
}
