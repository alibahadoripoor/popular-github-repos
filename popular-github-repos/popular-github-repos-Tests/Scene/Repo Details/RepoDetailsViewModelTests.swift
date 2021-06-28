//
//  RepoDetailsViewModelTests.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import XCTest
@testable import popular_github_repos

class RepoDetailsViewModelTests: XCTestCase {

    var viewModel: RepoDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        let webService = GithubWebService(dataService: RepoDataServiceMock())
        viewModel = RepoDetailsViewModel(webService: webService, repo: sampleRepository())
    }
    
    func testViewDidLoad(){
        let expectation = expectation(description: "View Did Load")

        viewModel.onFetchCompleted = {
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testHeaderViewModel(){
        viewModel.viewDidLoad()
        let headerViewModel = viewModel.headerViewModel()
        XCTAssertEqual(headerViewModel.name, "name")
    }
}
