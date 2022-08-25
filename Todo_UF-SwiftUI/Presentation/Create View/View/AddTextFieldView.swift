//
//  CreateTaskFieldsView.swift
//  Todo_UF-SwiftUI
//
//  Created by Victor Monteiro on 8/22/22.
//

import SwiftUI

struct AddTextFieldView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var titleText: String = ""
    @State private var descriptionText: String = "description here..."
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    let viewModel: ListViewModel
    let task: Task?
    let isEditing: Bool
    
    var body: some View {
        VStack {
            
            TextField(task == nil ? "type task here..." : task?.title ?? "", text: $titleText) {
                UIApplication.shared.endEditing()
            }
            .padding()
            .frame(height: 55)
            .foregroundColor(Color(uiColor: .systemGray2))
            .padding()
            
            VStack(spacing: 0) {
                HStack {
                    Text("Add a description")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                
                TextEditor(text: $descriptionText)
                    .frame(height: 80)
                    .foregroundColor(.gray)
                    .padding()
                    .onTapGesture {
                        if  self.descriptionText == "description here..." {
                            self.descriptionText = ""
                        }
                    }
            }
            .frame(maxWidth: .infinity)
            
            
            Button(action: {
                saveButtonPressed()
            }, label: {
                Text(isEditing ? "Save Changes".uppercased() : "Create Task".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 34)
                    .frame(maxWidth: .infinity)
                    .padding()
            })
            .background(Color.blue)
            .cornerRadius(8)
            .padding(.horizontal)
        }
        .onAppear {
            descriptionText = task == nil ? "description here..."  : task?.description ?? ""
        }
        .alert(isPresented: $showAlert, content: getAlert)
    }//END BODY
    
    func saveButtonPressed() {
        if isEditing {
            if isTextValid() {
                guard let task = task else {  return }
                viewModel.updateTask(task: task, title: titleText, description: descriptionText)
            }
        } else {
            if isTextValid() {
                viewModel.createTask(title: titleText, description: descriptionText)
            }
        }
        
        presentationMode.wrappedValue.dismiss()
    }
    
    func isTextValid() -> Bool {
        if titleText.count < 4 {
            alertTitle = "Your Task must be at least 4 characters Long 😉 !!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct CreateTaskFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        AddTextFieldView(viewModel: ListViewModel(taskUseCase: TaskUseCase()), task: nil, isEditing: true)
            .previewLayout(.sizeThatFits)
    }
}
