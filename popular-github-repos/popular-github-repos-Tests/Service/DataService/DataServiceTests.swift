//
//  DataServiceTests.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import XCTest
@testable import popular_github_repos

class DataServiceTests: XCTestCase {

    var dataService: DataServiceProtocol!
    
    override func setUp() {
        super.setUp()
        dataService = DataService()
    }
    
    func testDataService(){
        let expectation = expectation(description: "fetching data finished successfuly")
        
        dataService.fetchData(for: URL(string: "https://api.github.com/")!) { result in
            switch result{
            case .success(let data):
                XCTAssertNotNil(data)
                expectation.fulfill()
            default:
                break
            }
        }
        
        wait(for: [expectation], timeout: 8)
    }

}
