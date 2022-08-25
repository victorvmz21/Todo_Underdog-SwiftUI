//
//  UserDefaultsExtension.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import Foundation

extension UserDefaults: Storable {
    
    func fetchTasks() -> [Task] {
        let decoder = JSONDecoder()
        if let data = self.object(forKey: "tasks") as? Data {
            guard let tasks = try? decoder.decode([Task].self, from: data) else { return [] }
            return tasks
        } else {
            return []
        }
    }
    
    func saveTasks(tasks: [Task]) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(tasks) {
            self.set(data, forKey: "tasks")
        }
    }
    
    
}
