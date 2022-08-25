//
//  CreateView.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import SwiftUI

struct AddView: View {
   
    var viewModel: ListViewModel
    let task: Task?
    let isEditing: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                AddTextFieldView(viewModel: viewModel, task: task, isEditing: isEditing)
                Spacer()
            }
            .onTapGesture { UIApplication.shared.endEditing() }
        }
        .navigationTitle(isEditing ? "Edit Task" : "Add a task")
    }
    
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrollView{
                AddView(viewModel: ListViewModel(taskUseCase: TaskUseCase()), task: nil, isEditing: false)
            }
        }
    }
}
