//
//  GithubWebServiceTests.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import XCTest
@testable import popular_github_repos

class GithubWebServiceTests: XCTestCase {

    var reposListWebService: ReposListWebServiceProtocol!
    var repoWebService: RepoWebServiceProtocol!
    
    override func setUp(){
        super.setUp()
        reposListWebService = GithubWebService(dataService: ReposObjectDataServiceMock())
        repoWebService = GithubWebService(dataService: RepoDataServiceMock())
    }

    func testFetchRepos(){
        reposListWebService.fetchRepos(for: 1) { result in
            switch result{
            case .success(let reposObject):
                XCTAssertEqual(reposObject.repos.count, 30)
            default:
                break
            }
        }
    }

    func testFetchRepo(){
        repoWebService.fetchRepo(ownerName: "", repoName: "") { result in
            switch result{
            case .success(let repo):
                XCTAssertEqual(repo.name, "freeCodeCamp")
            default:
                break
            }
        }
    }
}
