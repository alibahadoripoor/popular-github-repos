//
//  RepoCellViewModelTests.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import XCTest
@testable import popular_github_repos

class RepoCellViewModelTests: XCTestCase {
    func testRepoCellViewModel() {
        let cellViewModel = RepoCellViewModel(repo: sampleRepository())
        XCTAssertEqual(cellViewModel.name, "name")
        XCTAssertEqual(cellViewModel.ownerName, "owner")
        XCTAssertEqual(cellViewModel.starsCount, "1000")
        XCTAssertEqual(cellViewModel.ownerAvatarURL?.absoluteString, "https://api.github.com/")
        XCTAssertEqual(cellViewModel.language, "Swift programming language")
    }
}


