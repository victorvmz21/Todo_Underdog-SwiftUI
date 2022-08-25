//
//  TaskUseCase.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import Foundation

protocol TaskUseCaseProtocol {
    func createTask(title: String, timeStamp: Date, description: String) -> Task
    func updateTask(task: Task, title: String, description: String) -> Task
    func save(tasks: [Task])
    func fetchTasks() -> [Task]
    func completeTask(task: Task) -> Task
    func delete(tasks: [Task], at: Int)
}

class TaskUseCase: TaskUseCaseProtocol {
    
    @Injected(\.storablerepository) var storage
    
    func createTask(title: String, timeStamp: Date, description: String) -> Task {
        let task = Task(title: title, timeStamp: timeStamp, isComplete: false, description: description)
        return task
    }
    
    func fetchTasks() -> [Task] {
        return storage.fetchTasks()
    }
    
    func updateTask(task: Task, title: String, description: String) -> Task {
        var task = task
        task.title = title
        task.description = description
        return task
    }
    
    func completeTask(task: Task) -> Task {
        var task = task
        task.isComplete.toggle()
        return task
    }
    
    func save(tasks: [Task]) {
        storage.saveTasks(tasks: tasks)
    }
    
    func delete(tasks: [Task], at: Int) {
        var tasks = tasks
        tasks.remove(at: at)
        save(tasks: tasks)
    }
    
}
