//
//  GithubAPIEndpoint.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

enum GithubWebServiceEndpoint{
    case repos
    
    private var scheme: String {
        return "https"
    }
    
    private var host: String {
        return "api.github.com"
    }
    
    private var reposBasePath: String {
        return "/search/repositories"
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        
        switch self {
        case .repos:
            components.path = reposBasePath
            components.queryItems = [
                URLQueryItem(name: "q", value: "stars:>=1"),
                URLQueryItem(name: "sort", value: "stars")
            ]
            return components.url
        }
    }
}
