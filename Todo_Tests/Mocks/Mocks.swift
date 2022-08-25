//
//  Mocks.swift
//  Todo_Tests
//
//  Created by Victor Monteiro on 8/24/22.
//

import Foundation

class MockViewModelFactory: ViewModelFactoryProtocol {
    
    var isListViewModelCalled: Bool = false
    
    func createListViewModel() -> ListViewModel {
        isListViewModelCalled = true
        return ListViewModel(taskUseCase: MockTaskUseCase())
    }
}

class MockRepositoryFactory: RepositoryFactoryProtocol {
    
    var isStorablerepositoryCalled: Bool = false
    
    func createStorableRepository(storage: Storable) -> StorableRepository {
        isStorablerepositoryCalled = true
        return StorableRepository(storage: storage)
    }
}
class MockUseCaseFactory: UseCaseFactoryProtocol {
    
    var isTaskUseCaseCreated: Bool = false
    
    func createTaskUseCase() -> TaskUseCaseProtocol {
        isTaskUseCaseCreated = true
        return MockTaskUseCase()
    }
}

class MockTaskUseCase: TaskUseCaseProtocol {
    
    var isCreateTaskCalled: Bool = false
    var isUpdateTaskCalled: Bool = false
    var isSaveTaskCalled: Bool = false
    var isFethTasksCalled: Bool = false
    var isCompleteTaskCalled: Bool = false
    var isDeleteTaskCalled: Bool = false
    var deleteTaskCount: Int = 0
    
    var tasks: [Task] = [
        Task(title: "Task 01", timeStamp: Date(), isComplete: false, description: "Test task 01"),
        Task(title: "Task 02", timeStamp: Date(), isComplete: false, description: "Test task 02"),
        Task(title: "Task 03", timeStamp: Date(), isComplete: false, description: "Test task 03")
    ]
    
    var storage: [Task] = []
    
    func createTask(title: String, timeStamp: Date, description: String) -> Task {
        isCreateTaskCalled = true
        return Task(title: title, timeStamp: timeStamp, isComplete: false, description: description)
    }
    
    func updateTask(task: Task, title: String, description: String) -> Task {
        var task = task
        task.title = title
        task.description = description
        isUpdateTaskCalled = true
        return task
    }
    
    func save(tasks: [Task]) {
        storage = tasks
        isSaveTaskCalled = true
    }
    
    func fetchTasks() -> [Task] {
        isFethTasksCalled = true
        return tasks
    }
    
    func completeTask(task: Task) -> Task {
        var task = task
        task.isComplete.toggle()
        isCompleteTaskCalled = true
        return task
    }
    
    func delete(tasks: [Task], at: Int) {
        var tasks = tasks
        tasks.remove(at: at)
        deleteTaskCount = tasks.count
        isDeleteTaskCalled = true
    }
    
    
}
