//
//  Todo_UF_SwiftUIApp.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import SwiftUI

@main
struct Todo_UF_SwiftUIApp: App {
    
    @Injected(\.viewModelFactory) var viewModelFactory
    
    var body: some Scene {
        WindowGroup {
            ListView(viewModel: viewModelFactory.createListViewModel())
        }
    }
}
