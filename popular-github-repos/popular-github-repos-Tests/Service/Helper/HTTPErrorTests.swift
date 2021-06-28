//
//  HTTPErrorTests.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import XCTest
@testable import popular_github_repos

class HTTPErrorTests: XCTestCase {
    func testHTTPError(){
        let networkError = HTTPError.network(description: "NETWORK ERROR").des
        let parsingError = HTTPError.parsing(description: "PARSING ERROR").des
        
        XCTAssertEqual(networkError, "An error occurred while fetching data: NETWORK ERROR")
        XCTAssertEqual(parsingError, "An error occurred while decoding data: PARSING ERROR")
        
    }
}
