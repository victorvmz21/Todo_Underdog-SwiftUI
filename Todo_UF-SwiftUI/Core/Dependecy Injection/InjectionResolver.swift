//
//  InjectionResolver.swift
//  ToDo - Underdog Fantasy
//
//  Created by Victor Monteiro on 8/20/22.
//

import Foundation

class InjectionResolver {
    
    static let shared: InjectionResolver = InjectionResolver()
    
    //MARK: - Factories
    lazy var viewModelFactory: ViewModelFactory = ViewModelFactory()
    lazy var repositoryFactory: RepositoryFactory = RepositoryFactory()
    lazy var useCaseFactory: UseCaseFactory = UseCaseFactory()
    
    //MARK: - Repository
    lazy var storablerepository: StorableRepository = repositoryFactory.createStorableRepository(storage: UserDefaults.standard)

}
