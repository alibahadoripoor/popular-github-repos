//
//  GithubEndpointTests.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import XCTest
@testable import popular_github_repos

class GithubEndpointTests: XCTestCase {
    func testGithubEndpoint(){
        let repoListURL = GithubEndpoint.repoList(page: 1).url
        let repoURL = GithubEndpoint.repo(ownerName: "alibahadoripoor", repoName: "popular_github_repos").url
        
        XCTAssertNotNil(repoListURL)
        XCTAssertNotNil(repoURL)
        XCTAssertEqual(repoListURL!.absoluteString, "https://api.github.com/search/repositories?q=stars:%3E%3D1&sort=stars&page=1")
        XCTAssertEqual(repoURL!.absoluteString, "https://api.github.com/repos/alibahadoripoor/popular_github_repos")
        
    }
}
