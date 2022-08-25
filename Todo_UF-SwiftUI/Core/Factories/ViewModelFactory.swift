//
//  ViewModelFactory.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import Foundation

protocol ViewModelFactoryProtocol {
    func createListViewModel() -> ListViewModel
}

class ViewModelFactory: ViewModelFactoryProtocol {
    
    @Injected(\.useCaseFactory) var useCaseFactory
    
    func createListViewModel() -> ListViewModel {
        return ListViewModel(taskUseCase: useCaseFactory.createTaskUseCase())
    }
}
