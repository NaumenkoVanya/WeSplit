//
//  Converted.swift
//  WeSplit
//
//  Created by Ваня Науменко on 17.02.24.
//

import SwiftUI

struct Converted: View {
    let unitArray = ["millimetre", "centimetre", "metre", "kilometre"]
    @State private var unitВefaultOf = "metre"
    @State private var unitВefaultIn = "kilometre"

    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }

//    var totalCheck: Double {
//        let tipSelection = Double(tipPercentage)
//        let tipValue = checkAmount / 100 * tipSelection
//        let grandTotal = checkAmount + tipValue
//
//        return grandTotal
//    }

    var body: some View {
        NavigationStack {
            Form {
                Section("enter the number") {
                    TextField("Amount", value: $checkAmount, format: .number)
                }
                .keyboardType(.numberPad)
                Section("select units of measurement") {
                    Picker("unit of", selection: $unitВefaultOf) {
                        ForEach(unitArray, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    Picker("unit in", selection: $unitВefaultIn) {
                        ForEach(unitArray, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }

                Section("result") {
                    Text(totalPerPerson, format: .number)
                }
            }
            .navigationTitle("Converted")
        }
    }
}

#Preview {
    Converted()
}
