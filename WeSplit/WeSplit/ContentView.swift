//
//  ContentView.swift
//  WeSplit
//
//  Created by Ваня Науменко on 9.02.24.
//

import SwiftUI

struct ContentView: View {
      let students = ["Harry", "Hermiona", "Ron"]
      @State private var selectedStudent = "Harry"
    
      @State private var tapCount = 0
      @State private var name = ""
    
    var body: some View {

        NavigationStack {
            Form {
                TextField("Enter your name", text: $name)
                Text("Your name is \(name)")
                
                Section {
                    Text("Hello, world!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        
        
//        Form {
//            ForEach(0..<100) {
//                Text("Row \($0)")
//            }
//        }
        
        Button("Tap Count: \(tapCount)") {
                    tapCount += 1
                }
        
    }
}

#Preview {
    ContentView()
}
