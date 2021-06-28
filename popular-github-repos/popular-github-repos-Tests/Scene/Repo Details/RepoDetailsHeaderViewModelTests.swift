//
//  RepoDetailsHeaderViewModelTests.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import XCTest
@testable import popular_github_repos

class RepoDetailsHeaderViewModelTests: XCTestCase {
    func testRepoDetailsHeaderViewModel(){
        let headerViewModel = RepoDetailsHeaderViewModel(repo: sampleRepository())
        XCTAssertEqual(headerViewModel.name, "name")
        XCTAssertEqual(headerViewModel.ownerName, "owner")
        XCTAssertEqual(headerViewModel.starsCount, "1000")
        XCTAssertEqual(headerViewModel.forksCount, "300")
        XCTAssertEqual(headerViewModel.watchersCount, "400")
        XCTAssertEqual(headerViewModel.ownerAvatarURL?.absoluteString, "https://api.github.com/")
        XCTAssertEqual(headerViewModel.language, "Swift programming language")
        XCTAssertNil(headerViewModel.description)
    }
}
