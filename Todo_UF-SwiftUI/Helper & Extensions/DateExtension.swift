//
//  DateExtension.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import Foundation
extension Date {
    var timestamp: String {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        return dataFormatter.string(from: self)
    }
}
