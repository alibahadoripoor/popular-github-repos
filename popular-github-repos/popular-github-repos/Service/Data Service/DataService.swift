//
//  DataService.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

typealias fetchDataCompletion = (Data?, GithubWebServiceError?) -> ()

protocol DataServiceProtocol {
    func fetchData(for url: URL, completion: @escaping (Data?, GithubWebServiceError?) -> ())
}

final class DataService: DataServiceProtocol{
    let session: URLSession = .shared
    
    func fetchData(for url: URL, completion: @escaping (Data?, GithubWebServiceError?) -> ()){
        
        let task = session.dataTask(with: url) { (data, response, error) in
                    
            DispatchQueue.main.async {
                
                guard error == nil else {
                    debugPrint("The request is failed: \(error!.localizedDescription)")
                    completion(nil, .network(description: error!.localizedDescription))
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    debugPrint("Unable to process response")
                    completion(nil, .network(description: "Unable to process response"))
                    return
                }
                
                guard response.statusCode == 200 else {
                    debugPrint("Failure response: \(response.statusCode)")
                    completion(nil, .network(description: "Failure response: \(response.statusCode)"))
                    return
                }
                
                guard let data = data else {
                    debugPrint("No data returned")
                    completion(nil, .network(description: "No data returned"))
                    return
                }
                
                completion(data, nil)
                
            }
            
        }
        
        task.resume()
    }
    
}
