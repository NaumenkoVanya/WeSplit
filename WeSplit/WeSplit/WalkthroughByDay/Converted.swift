//
//  Converted.swift
//  WeSplit
//
//  Created by Ваня Науменко on 17.02.24.
//

import SwiftUI
// import Foundation

struct Converted: View {
    @State private var inputValue = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    
    let units: [UnitLength] = [.centimeters, .meters, .kilometers]
    let unitLabels = ["Centimeters", "Meters", "Kilometers"]
    
    var convertedValue: Measurement<UnitLength>? {
        guard let inputValue = Double(inputValue) else { return nil }
        let inputUnit = units[inputUnit]
        let outputUnit = units[outputUnit]
        let inputMeasurement = Measurement(value: inputValue, unit: inputUnit)
        return inputMeasurement.converted(to: outputUnit)
    }
    var body: some View {
        VStack {
            TextField("Enter value", text: $inputValue)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            Picker("Input Unit", selection: $inputUnit) {
                ForEach(0..<units.count) {
                    Text(self.unitLabels[$0]).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Picker("Output Unit", selection: $outputUnit) {
                ForEach(0..<units.count) {
                    Text(self.unitLabels[$0]).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if let convertedValue = convertedValue {
                Text("Converted Value: \(convertedValue.description)")
            } else {
                Text("Invalid input")
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    Converted()
}
