//
//  NetworkingTest.swift
//  Tests iOS
//
//  Created by Byron Chavarría on 13/4/22.
//

import XCTest
@testable import reddit_chile

class NetworkingTest: XCTestCase {
    
    func testGetPosts() {
        let expectation = XCTestExpectation(description: #function)
        
        var posts = [Child]()
        let networkingManager = NetworkManager()
        networkingManager.getPosts { response, closureStringValue in
            posts = response?.data?.children ?? []
            XCTAssertNotNil(response)
            XCTAssertNotNil(posts)
            expectation.fulfill()
        } errorClosure: { error in
            XCTAssertThrowsError(error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3.0)
    }
    
    func testSearchPosts() {
        let expectation = XCTestExpectation(description: #function)
        
        var posts = [Child]()
        let networkingManager = NetworkManager()
        networkingManager.searchPosts(query: "A") { response, closureString in
            posts = response?.data?.children ?? []
            XCTAssertNotNil(response)
            XCTAssertNotNil(posts)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetPostsFail() {
        let expectation = XCTestExpectation(description: #function)
        var posts = [Child]()
        let networkingManager = NetworkManager()
        networkingManager.baseUrl = "https://www.google.com"
        networkingManager.getPosts { response, closureStringValue in
            posts = response?.data?.children ?? []
            XCTAssertNil(response)
            XCTAssertNotNil(posts)
            expectation.fulfill()
        } errorClosure: { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
}
