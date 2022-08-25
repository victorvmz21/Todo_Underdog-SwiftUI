//
//  RepositoryFactoryTests.swift
//  Todo_Tests
//
//  Created by Victor Monteiro on 8/24/22.
//

import XCTest

class RepositoryFactoryTests: XCTestCase {
    
    let mockRepositoryFactory = MockRepositoryFactory()
    let mockDefaults = UserDefaults.standard
    
    func test_isStorableRepositoryCreatedSuccess() throws {
        let storableRepository: StorableRepository? = mockRepositoryFactory.createStorableRepository(storage: mockDefaults)
        XCTAssertNotNil(storableRepository)
    }
    
    func test_isStorableRepositoryCalledSuccess() throws {
        let _ = mockRepositoryFactory.createStorableRepository(storage: mockDefaults)
        XCTAssertTrue(mockRepositoryFactory.isStorablerepositoryCalled)
    }
    
}
