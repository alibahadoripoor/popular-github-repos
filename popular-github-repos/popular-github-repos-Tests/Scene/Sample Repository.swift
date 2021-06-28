//
//  Sample Repository.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

@testable import popular_github_repos

func sampleRepository() -> Repository{
    let owner = Owner(id: 2, name: "owner", avatarURL: "https://api.github.com/")
    return Repository(id: 1, name: "name", description: nil, owner: owner, language: "Swift", starsCount: 1000, forksCount: 300, watchersCount: 400)
}
