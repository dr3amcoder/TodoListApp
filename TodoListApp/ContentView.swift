//
//  ContentView.swift
//  TodoListApp
//
//  Created by Janna Limpin on 04/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var todoTextField: String = ""
    @State var todoDataArray: [String] = []
    @State var toggleButton: Bool = false
    
    var body: some View {
        VStack {
            Image("TodoList")
                .resizable()
                .frame(width: 200, height: 200)
            Text("Todo List")
                .font(.largeTitle.bold())
                .fontDesign(Font.Design.monospaced)
                .foregroundColor(Color(.systemPink))
            Text("Toggle all them off!")
                .font(.body)
            
            
            HStack {
                TextField("Please enter a todo", text: $todoTextField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.teal)
                    .font(.headline)
                
                Button(action: {
                    if validInput() {
                        saveTodo()
                    }
                }, label: {
                    Text("Save".uppercased())
                        .fontWeight(.heavy)
                        .background(validInput() ? Color(.systemCyan) : Color(.lightGray))
                        .foregroundColor(.white)
                        .cornerRadius(1)
                })
                .disabled(!validInput())
                
            }
            .padding()
            
            
            ForEach(todoDataArray, id: \.self) { todo in
                Toggle(isOn: $toggleButton) {
                    Text(todo)
                        .foregroundColor(.mint)
                        .font(.headline.bold())
                }
                .toggleStyle(SwitchToggleStyle(tint: Color(.systemTeal)))
            }
            
            
        }
        .padding()
    }
    
    
    func validInput() -> Bool {
        if todoTextField.count >= 3 {
            return true
        }
        return false
    }
    
    
    func saveTodo() {
        todoDataArray.append(todoTextField)
        todoTextField = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
