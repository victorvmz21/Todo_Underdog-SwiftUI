//
//  UseCaseFactory.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import Foundation

protocol UseCaseFactoryProtocol {
    func createTaskUseCase() -> TaskUseCaseProtocol
}

class UseCaseFactory: UseCaseFactoryProtocol {
    func createTaskUseCase() -> TaskUseCaseProtocol {
        return TaskUseCase()
    }
}
