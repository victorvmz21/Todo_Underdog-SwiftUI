//
//  UIApplicationExtension.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

