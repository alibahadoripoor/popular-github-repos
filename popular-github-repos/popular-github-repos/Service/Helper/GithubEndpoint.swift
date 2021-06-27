//
//  GithubEndpoint.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

enum GithubEndpoint{
    case repos(page: Int)
    
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
        case .repos(let page):
            components.path = reposBasePath
            components.queryItems = [
                URLQueryItem(name: "q", value: "stars:>=1"),
                URLQueryItem(name: "sort", value: "stars"),
                URLQueryItem(name: "page", value: "\(page)")
            ]
            return components.url
        }
    }
}
