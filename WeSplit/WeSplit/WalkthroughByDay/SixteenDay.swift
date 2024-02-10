//
//  16 day .swift
//  WeSplit
//
//  Created by Ваня Науменко on 9.02.24.
//

import SwiftUI

struct SixteenDay: View {
    
    let students = ["Harry", "Hermiona", "Ron"]
    @State private var selectedStudent = "Harry"
  
    @State private var tapCount = 0
    @State private var name = ""
    @State private var secondName = ""
    
    
    var body: some View {
        
        NavigationStack {
            Form {
                TextField("Enter your name", text: $name)
                Text("Your name is \(name)")
                
                Section {
                    TextField("Enter your second name", text: $secondName)
                    Text("You second name \(secondName)")
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
    SixteenDay()
}
