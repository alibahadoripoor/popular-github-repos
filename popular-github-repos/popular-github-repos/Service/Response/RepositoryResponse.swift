//
//  RepositoryResponse.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

struct RepositoryResponse: Decodable {
    let totalCount: Int
    let repos: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case repos = "items"
    }
}

struct Repository: Decodable {
    let id: Int
    let name: String
    let description: String
    let starsCount: Int
    let forksCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case starsCount = "stargazers_count"
        case forksCount = "forks_count"
    }
}
