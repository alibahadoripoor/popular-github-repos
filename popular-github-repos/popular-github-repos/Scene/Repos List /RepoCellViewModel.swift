//
//  RepoCellViewModel.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 26.06.21.
//

import Foundation

final class RepoCellViewModel {
    let name: String
    let ownerName: String
    let ownerAvatarURL: URL?
    var description: String = ""
    let starsCount: String
    let forksCount: String
    
    init(repo: Repository) {
        name = repo.name
        ownerName = repo.owner.name
        ownerAvatarURL = URL(string: repo.owner.avatarURL)
        starsCount = "\(repo.starsCount)"
        forksCount = "\(repo.forksCount)"
        
        if let des = repo.description {
            description += des
        }
        
        if let language = repo.language {
            description += "\n\(language) programming language"
        }
    }
}
