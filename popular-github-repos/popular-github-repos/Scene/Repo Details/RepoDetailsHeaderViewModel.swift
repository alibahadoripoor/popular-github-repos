//
//  RepoDetailsHeaderViewModel.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 27.06.21.
//

import Foundation

final class RepoDetailsHeaderViewModel{
    let name: String
    let ownerName: String
    let ownerAvatarURL: URL?
    var language: String?
    let description: String?
    let starsCount: String
    let forksCount: String
    let watchersCount: String
    
    init(repo: Repository) {
        name = repo.name
        ownerName = repo.owner.name
        ownerAvatarURL = URL(string: repo.owner.avatarURL)
        description = repo.description
        starsCount = "\(repo.starsCount)"
        forksCount = "\(repo.forksCount)"
        watchersCount = "\(repo.watchersCount)"
        
        if let language = repo.language {
            self.language = "\(language) programming language"
        }
    }
}
