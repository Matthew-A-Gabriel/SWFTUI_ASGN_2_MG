//
//  ContentView.swift
//  To-Do List
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var search: String = ""
    @State var counterVar = 0
    @State var listArr:[String] = []
    
    var body: some View {
        
        VStack {
            Text("To Do List")
                .font(.title)
                .fontWeight(.bold)
            Text("Number of Tasks: \(counterVar)")
            
            
        }
        HStack {
            Button(action: {
                addToList()
            }, label:{
                Text("Add to List")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            })
            
            Button(action: {
                removeAllTasks()
            }, label:{
                Text("Remove all Tasks")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            })
        }
        TextField(
                "Enter Task",
                text: $search
            )
            .onSubmit {
                addToList()
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.secondary)
            .frame(width: 300)
        VStack {
            List(listArr, id: \.self){ term in
                    Text(term)
            }
            
            
            
        }
        .padding()
    }
    func addToList(){
        if (search == ""){
            
        } else {
            listArr.append(search)
            counterVar += 1
        }
    }
    func removeAllTasks(){
        while listArr.count > 0{
            listArr.removeFirst()
        }
        counterVar = 0
    }
}

#Preview {
    ContentView()
}
//Create a new SwiftUI project named "To-Do List" in Xcode.
//Add the following to your To-Do List:
//A text field for users to enter new tasks.
//A button to add tasks to the list.
//Validation to prevent users from adding empty tasks.
//Display the number of tasks currently in the list.
//Allow users to delete one or all tasks from the list.
//Test the application to ensure that it functions correctly:
//Try adding tasks without entering any text and verify that the task does not get added to the list.
//Add several tasks to the list and verify that they are displayed correctly.
//Test the delete functionality to ensure that tasks can be removed from the list.
//Test the feature where the buttons turn blue when a special condition is met.
//Extra Credit: You can challenge yourself by adding additional features such as:
//A "Clear All" button to remove all tasks from the list. (1 Point)
//A "toast" alert that appears when the user tries to add an empty task (2 point)
//Things you might want to look into:
//
//.disabled( ) modifier: used for making a component non-interactable
//.alert( ): used for displaying an alert message
//.textFieldStyle( ):  modifier for Lists to determine what the List should look like
//Ternary Operators: used for making the buttons a specific color based on whether there is a task present in the list or not.
