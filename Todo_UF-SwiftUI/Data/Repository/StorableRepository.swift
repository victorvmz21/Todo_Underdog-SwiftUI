//
//  StorableRepository.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import Foundation

protocol Storable {
    func fetchTasks() -> [Task]
    func saveTasks(tasks: [Task])
}

class StorableRepository {
    
    let storage: Storable
    
    init(storage: Storable) {
        self.storage = storage
    }
    
    func fetchTasks() -> [Task] {
        return storage.fetchTasks()
    }
    
    func saveTasks(tasks: [Task]) {
        storage.saveTasks(tasks: tasks)
    }
    
}
