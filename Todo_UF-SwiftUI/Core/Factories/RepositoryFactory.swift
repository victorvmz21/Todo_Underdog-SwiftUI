//
//  RepositoryFactory.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import Foundation

protocol RepositoryFactoryProtocol {
    func createStorableRepository(storage: Storable) -> StorableRepository
}

class RepositoryFactory: RepositoryFactoryProtocol {
    func createStorableRepository(storage: Storable) -> StorableRepository {
        return StorableRepository(storage: storage)
    }
}
