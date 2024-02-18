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
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.3, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.6, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
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
                    Text("No data")
                }
                
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    Converted()
}
