//
//  Task.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import Foundation

struct Task: Codable, Hashable {
    
    let id: String
    var title: String
    let timeStamp: Date
    var isComplete: Bool
    var description: String
    
    init(id: String = UUID().uuidString, title: String, timeStamp: Date, isComplete: Bool, description: String) {
        self.id = id
        self.title = title
        self.timeStamp = timeStamp
        self.isComplete = isComplete
        self.description = description
    }

}
