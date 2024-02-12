//
//  ContentView.swift
//  WeSplit
//
//  Created by Ваня Науменко on 9.02.24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool

    let tipPercentages = [10, 15, 20, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalCheck: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    // Oпределениe местной валюты для TF
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                    // .pickerStyle(.navigationLink) слисок количество человек
                }

                Section("How much tip do you want to lesve?") {
                    //Text("How much tip do you want to lesve?")
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    //.pickerStyle(.segmented)
                }
                
                Section("Total check") {
                    Text(totalCheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(tipPercentage == 0 ? .red : .green)
                }

                Section("amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}




#Preview {
    ContentView()
}
