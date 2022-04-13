//
//  PostsListViewModelTest.swift
//  Tests iOS
//
//  Created by Byron Chavarría on 13/4/22.
//

import XCTest

class PostsListViewModelTest: XCTestCase {

    func testViewModelGetPosts() {
        let viewModel = PostsListViewModel()
        viewModel.getPosts()
        XCTAssertNotNil(viewModel.posts)
        XCTAssertTrue(viewModel.isLoading)
        viewModel.isLoading = false
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testViewModelSearchPosts() {
        let viewModel = PostsListViewModel()
        viewModel.searchPosts(with: "A")
        XCTAssertNotNil(viewModel.posts)
        XCTAssertTrue(viewModel.isLoading)
        viewModel.isLoading = false
        XCTAssertFalse(viewModel.isLoading)
    }

}
