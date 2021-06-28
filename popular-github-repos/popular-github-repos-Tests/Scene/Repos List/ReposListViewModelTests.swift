//
//  ReposListViewModelTests.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import XCTest
@testable import popular_github_repos

class ReposListViewModelTests: XCTestCase {
    
    var viewModel: ReposListViewModel!
    
    override func setUp() {
        super.setUp()
        let webService = GithubWebService(dataService: ReposObjectDataServiceMock())
        viewModel = ReposListViewModel(webService: webService)
    }
    
    func testViewDidLoad(){
        let expectation = expectation(description: "View Did Load")

        viewModel.onFetchCompleted = { type in
            XCTAssertEqual(type, .firstLoad)
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testViewDidRefresh(){
        let expectation = expectation(description: "View Did Refresh")
        viewModel.viewDidLoad()
        
        viewModel.onFetchCompleted = { type in
            XCTAssertEqual(type, .refresh)
            expectation.fulfill()
        }
        viewModel.viewDidRefresh()
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testViewDidScrollToBottom(){
        let expectation = expectation(description: "Next Page Did Load")
        viewModel.viewDidLoad()
        
        viewModel.onFetchCompleted = { type in
            XCTAssertEqual(type, .nextPage)
            expectation.fulfill()
        }
        viewModel.viewDidScrollToBottom()
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testCellNumber(){
        viewModel.viewDidLoad()
        XCTAssertEqual(viewModel.cellNumber(), 30)
        viewModel.viewDidScrollToBottom()
        XCTAssertEqual(viewModel.cellNumber(), 60)
        viewModel.viewDidScrollToBottom()
        XCTAssertEqual(viewModel.cellNumber(), 90)
    }
    
    func testCellViewModel(){
        viewModel.viewDidLoad()
        let indexPath = IndexPath(item: 2, section: 0)
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        XCTAssertEqual(cellViewModel.name, "free-programming-books")
    }
}
