//
//  RepoCellViewModel.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 26.06.21.
//

import Foundation

final class RepoCellViewModel {
    let name: String
    let des: String?
    let language: String?
    let starsCount: String
    let forksCount: String
    
    init(repo: Repository) {
        name = repo.name
        des = repo.description
        language = repo.language != nil ? repo.language! + " programming language" : ""
        starsCount = "\(repo.starsCount)"
        forksCount = "\(repo.forksCount)"
    }
}
