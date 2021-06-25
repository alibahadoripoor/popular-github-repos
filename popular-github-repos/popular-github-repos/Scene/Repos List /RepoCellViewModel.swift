//
//  RepoCellViewModel.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 26.06.21.
//

import Foundation

final class RepoCellViewModel {
    let name: String
    let des: String
    let starsCount: String
    let forksCount: String
    let identifire: String
    
    init(repo: Repository) {
        name = repo.name
        des = repo.description
        starsCount = "\(repo.starsCount)"
        forksCount = "\(repo.forksCount)"
        identifire = String(describing: RepoCell.self)
    }
}
