//
//  UseCaseFactorytests.swift
//  Todo_Tests
//
//  Created by Victor Monteiro on 8/24/22.
//

import XCTest

class UseCaseFactorytests: XCTestCase {

    let mockUseCaseFactory = MockUseCaseFactory()
    
    func test_isTaskUseCaseCreatedSuccess() throws {
        let taskUseCase: TaskUseCaseProtocol? = mockUseCaseFactory.createTaskUseCase()
        XCTAssertNotNil(taskUseCase)
    }
    
    func test_isCreateTaskUseCaseCalledSuccess() throws {
        let _ = mockUseCaseFactory.createTaskUseCase()
        XCTAssertTrue(mockUseCaseFactory.isTaskUseCaseCreated)
    }

}
