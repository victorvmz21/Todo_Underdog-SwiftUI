//
//  ViewModelFactoryTests.swift
//  Todo_Tests
//
//  Created by Victor Monteiro on 8/24/22.
//

import XCTest

class ViewModelFactoryTests: XCTestCase {
    
    let mockViewModelFactory = MockViewModelFactory()

    func test_isListViewModelCreatedSuccess() throws {
        let listViewModel: ListViewModel? = mockViewModelFactory.createListViewModel()
        XCTAssertNotNil(listViewModel)
    }

    func test_isListViewModelCalledSuccess() throws {
        let _ = mockViewModelFactory.createListViewModel()
        XCTAssertTrue(mockViewModelFactory.isListViewModelCalled)
    }
}
