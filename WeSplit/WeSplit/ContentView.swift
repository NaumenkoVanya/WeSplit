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

    let tipPercentages = [10, 15, 20, 0]

    var body: some View {
        Form {
            Section {
                // Лучшее использование для определения местной валюты для TF
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }

            Section {
                Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
    }
}

#Preview {
    ContentView()
}
