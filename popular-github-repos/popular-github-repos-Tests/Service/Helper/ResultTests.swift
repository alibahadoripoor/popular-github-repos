//
//  ResultTests.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import XCTest
@testable import popular_github_repos

class ResultTests: XCTestCase {
    var result: Result<String, HTTPError>!
    
    func testFailureResult(){
        let expectation = expectation(description: "successful failure result")
        result = Result.failure(.network(description: "NETWORK ERROR"))
        
        switch result {
        case .failure(let error):
            XCTAssertEqual(error.des, "An error occurred while fetching data: NETWORK ERROR")
            expectation.fulfill()
        default:
            break
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testSuccessResult(){
        let expectation = expectation(description: "successful success result")
        result = Result.success("success")
        
        switch result {
        case .success(let str):
            XCTAssertEqual(str, "success")
            expectation.fulfill()
        default:
            break
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
