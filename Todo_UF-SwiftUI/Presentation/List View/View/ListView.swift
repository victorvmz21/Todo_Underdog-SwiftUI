//
//  ListView.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators:  false) {
                ForEach(viewModel.tasks.indices, id: \.self) { indices in
                    ListRowView(task: viewModel.tasks[indices],
                                viewModel: viewModel,
                                indice: indices)
                }
                .padding()
                .navigationTitle("Todo List")
                .onAppear{ viewModel.fetchTasks() }
                .navigationBarItems(trailing: NavigationLink("Add", destination: AddView(viewModel: viewModel, task: nil, isEditing: false)))
            }
            
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ListViewModel(taskUseCase: TaskUseCase()))
    }
}
