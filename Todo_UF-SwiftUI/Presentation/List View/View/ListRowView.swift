//
//  ListRowView.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import SwiftUI

struct ListRowView: View {
    
    let task: Task
    let viewModel: ListViewModel
    let indice: Int
    
    var body: some View {
        NavigationLink(destination: AddView(viewModel: viewModel, task: task, isEditing: true)) {
            HStack(spacing: 20){
                Button(action: {
                    withAnimation(.linear) {
                        viewModel.complteTask(task: task)
                    }
                }, label: {
                    Image(systemName: task.isComplete ? "checkmark.circle" : "circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(task.isComplete ? .red : .black)
                })
                
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(task.isComplete ? .red : .black)
                    Text(task.timeStamp.timestamp)
                        .font(.system(size: 14))
                        .foregroundColor(task.isComplete ? .red : .black)
                }
                Spacer()
                
                Button(action: {
                    viewModel.delete(at: indice)
                }, label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                })
                .foregroundColor(.red)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 0)
        }
        
    }

}

struct ListTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListRowView(task: Task(title: "Test", timeStamp: Date(),
                                 isComplete: false, description: "description"),
                        viewModel: ListViewModel(taskUseCase: TaskUseCase()), indice: 0)
            .previewLayout(.sizeThatFits)
           
        }
    }
}
