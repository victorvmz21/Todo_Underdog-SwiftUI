//
//  Injected.swift
//  ToDo - Underdog Fantasy
//
//  Created by Victor Monteiro on 8/20/22.
//

import Foundation

@propertyWrapper
struct Injected<T> {
    var wrappedValue: T

    init(_ keyPath: KeyPath<InjectionResolver, T>) {
        self.wrappedValue = InjectionResolver.shared[keyPath: keyPath]
    }
}
