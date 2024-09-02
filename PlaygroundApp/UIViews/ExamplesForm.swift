//
//  ExamplesForm.swift
//  WeSplit
//
//  Created by Leonardo Kiszewski on 28/08/23.
//

import SwiftUI

struct ExamplesForm: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Text("Hello, world! 2")
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                    }
                }
                
                Section {
                    TextField("Enter your name", text: $name)
                    TextField("Enter your name 2", text: $name)
                    Text("Name is \(name)")
                    Button("Tap Count: \(tapCount)") {
                          tapCount += 1
                      }
                }
                
//                Section {
//                    ForEach(0..<100) { number in
//                        Text("Row \(number)")
//                    }
//                }
                
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                             ForEach(students, id: \.self) {
                                 Text($0)
                             }
                         }
                }
            }
            Text(" My other text ")
        }
        .navigationTitle("My title")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct ExamplesForm_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesForm()
    }
}
