//
//  ContentView.swift
//  TodoListApp
//
//  Created by Janna Limpin on 04/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var todoTextField: String = ""
    @State var todoDataArray: [(String, Bool)] = []
//    @State var toggleButton: Bool = false
    
    
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
            
            
            ForEach(todoDataArray.indices, id: \.self) { index in
                Toggle(isOn: Binding(
                    get: { self.todoDataArray[index].1 },
                    set: { newValue in self.todoDataArray[index].1 = newValue }
                )) {
                    Text(self.todoDataArray[index].0)
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
        todoDataArray.append((todoTextField, false))
        todoTextField = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
