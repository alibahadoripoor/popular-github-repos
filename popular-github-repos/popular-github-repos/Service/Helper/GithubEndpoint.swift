//
//  GithubEndpoint.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

enum GithubEndpoint{
    case repoList(page: Int)
    case repo(ownerName: String, repoName: String)
    
    private var scheme: String {
        return "https"
    }
    
    private var host: String {
        return "api.github.com"
    }
    
    private var repoListBasePath: String {
        return "/search/repositories"
    }
    
    private var repoBasePath: String {
        return "/repos/"
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        
        switch self {
        case .repoList(let page):
            components.path = repoListBasePath
            components.queryItems = [
                URLQueryItem(name: "q", value: "stars:>=1"),
                URLQueryItem(name: "sort", value: "stars"),
                URLQueryItem(name: "page", value: "\(page)")
            ]
            return components.url
        case .repo(let ownerName, let repoName):
            components.path = repoBasePath + ownerName + "/" + repoName
            return components.url
        }
    }
}
