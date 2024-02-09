//
//  ContentView.swift
//  WeSplit
//
//  Created by Ваня Науменко on 9.02.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapCount = 0
    
    var body: some View {
        
        Button("Tap Count: \(tapCount)") {
                    tapCount += 1
                }
        

        
        NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ContentView()
}
