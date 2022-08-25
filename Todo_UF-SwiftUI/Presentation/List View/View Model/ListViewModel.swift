//
//  ListViewModel.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    
    let taskUseCase: TaskUseCaseProtocol
    
    init(taskUseCase: TaskUseCaseProtocol) {
        self.taskUseCase = taskUseCase
    }
    
    func createTask(title: String, description: String) {
        let task = taskUseCase.createTask(title: title, timeStamp: Date(), description: description)
        self.tasks.append(task)
        save(tasks: self.tasks)
    }
    
    func save(tasks: [Task]) {
        taskUseCase.save(tasks: tasks)
    }
    
    func fetchTasks() {
        let filteredTasks = taskUseCase.fetchTasks().sorted(by: { $0.isComplete == true || $0.timeStamp < $1.timeStamp })
        self.tasks = filteredTasks
    }
    
    func delete(at: Int) {
        taskUseCase.delete(tasks: self.tasks, at: at)
        fetchTasks()
    }
    
    func complteTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = taskUseCase.completeTask(task: task)
        }
        save(tasks: tasks)
        fetchTasks()
    }
    
    func updateTask(task: Task, title: String, description: String) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = taskUseCase.updateTask(task: task, title: title, description: description)
        }
        save(tasks: tasks)
    }
}
