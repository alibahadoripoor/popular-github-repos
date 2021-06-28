//
//  HTTPURLResponseTests.swift
//  popular-github-repos-Tests
//
//  Created by Mohammadali Bahadoripoor on 28.06.21.
//

import XCTest
@testable import popular_github_repos

class HTTPURLResponseTests: XCTestCase {
    func testHasSuccessStatusCode(){
        let response = HTTPURLResponse(url: URL(string: "https://api.github.com/")!, statusCode: 202, httpVersion: nil, headerFields: nil)
        XCTAssertNotNil(response)
        XCTAssertTrue(response!.hasSuccessStatusCode)
    }
}
