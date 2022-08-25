//
//  TaskUseCaseTests.swift
//  Todo_Tests
//
//  Created by Victor Monteiro on 8/24/22.
//

import XCTest

class TaskUseCaseTests: XCTestCase {

   let mockTaskUseCase = MockTaskUseCase()
    
    func test_isCreatingTaskSuccess() throws {
        let task: Task? = mockTaskUseCase.createTask(title: "Task 00", timeStamp: Date(), description: "Test task 00")
        XCTAssertNotNil(task)
    }
    
    func test_isCreateTaskCalledSucces() throws {
        let _ = mockTaskUseCase.createTask(title: "Task 00", timeStamp: Date(), description: "Test task 00")
        XCTAssertTrue(mockTaskUseCase.isCreateTaskCalled)
    }
    
    func test_isUpdatingTaskSuccess() throws {
        let task = mockTaskUseCase.tasks[0]
        let updatedTask = mockTaskUseCase.updateTask(task: task, title: "Task 000", description: "Test task 000")
        XCTAssertNotEqual(task.title, updatedTask.title)
        XCTAssertNotEqual(task.description, updatedTask.description)
    }
    
    func test_isUpdateTaskCalledSuccess() throws {
        let task = mockTaskUseCase.tasks[0]
        let _ = mockTaskUseCase.updateTask(task: task, title: "Task 000", description: "Test task 000")
        XCTAssertTrue(mockTaskUseCase.isUpdateTaskCalled)
    }
    
    func test_isSavingTaskSuccess() throws {
        mockTaskUseCase.save(tasks: mockTaskUseCase.tasks)
        XCTAssertEqual(mockTaskUseCase.storage, mockTaskUseCase.tasks)
    }
    
    func test_isSaveTaskCalledSuccess() {
        mockTaskUseCase.save(tasks: mockTaskUseCase.tasks)
        XCTAssertTrue(mockTaskUseCase.isSaveTaskCalled)
    }
    
    func test_isFetchingTasksSuccess() throws {
        let tasks = mockTaskUseCase.fetchTasks()
        XCTAssertEqual(tasks, mockTaskUseCase.tasks)
    }
    
    func test_isFetchTasksCalledSuccess() throws {
        let _ = mockTaskUseCase.fetchTasks()
        XCTAssertTrue(mockTaskUseCase.isFethTasksCalled)
    }
    
    func test_isCompletingTaskSuccess() throws {
        let incompleteTask = mockTaskUseCase.tasks[0]
        let completedTask = mockTaskUseCase.completeTask(task: incompleteTask)
        XCTAssertNotEqual(incompleteTask, completedTask)
    }
    
    func test_isCompleteTaskCalledSuccess() throws {
        let _ = mockTaskUseCase.completeTask(task: mockTaskUseCase.tasks[0])
        XCTAssertTrue(mockTaskUseCase.isCompleteTaskCalled)
    }
    
    func test_isDeleteTaskSuccess() throws {
        let tasks = mockTaskUseCase.tasks
        let tasksCount = tasks.count
        mockTaskUseCase.delete(tasks: tasks, at: 0)
        XCTAssertNotEqual(tasksCount, mockTaskUseCase.deleteTaskCount)
        
    }
    
    func test_isDeleteTaskCalledSuccess() throws {
        mockTaskUseCase.delete(tasks: mockTaskUseCase.tasks, at: 0)
        XCTAssertTrue(mockTaskUseCase.isDeleteTaskCalled)
    }

}
