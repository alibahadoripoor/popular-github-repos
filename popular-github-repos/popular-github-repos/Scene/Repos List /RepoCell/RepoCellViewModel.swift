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
    var language: String?
    let starsCount: String
    
    init(repo: Repository) {
        name = repo.name
        ownerName = repo.owner.name
        ownerAvatarURL = URL(string: repo.owner.avatarURL)
        starsCount = "\(repo.starsCount)"
        
        if let language = repo.language {
            self.language = "\(language) programming language"
        }
    }
}
