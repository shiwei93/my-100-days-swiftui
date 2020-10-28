//
//  TemperatureView.swift
//  ConversionChallenge
//
//  Created by shiwei on 2020/10/26.
//

import SwiftUI

enum Temperature: String, CaseIterable {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
    case kelvin = "Kelvin"
}

struct TemperatureView: View {
    @State private var inputSelection = Temperature.celsius
    @State private var outputSelection = Temperature.celsius

    @State private var userInput = ""

    var conversionResult: Double {
        let userInput = Double(self.userInput) ?? 0
        let selection = (inputSelection, outputSelection)
        switch selection {
        case (.celsius, .fahrenheit):
            return (userInput * 9.0 / 5.0) + 32
        case (.celsius, .kelvin):
            return userInput + 273.15
        case (.fahrenheit, .celsius):
            return (userInput - 32.0) * 5.0 / 9.0
        case (.fahrenheit, .kelvin):
            return (userInput - 32.0) * 5.0 / 9.0 + 273.15
        case (.kelvin, .celsius):
            return userInput - 273.15
        case (.kelvin, .fahrenheit):
            return (userInput - 273.15) * 9.0 / 5.0 + 32
        default:
            return userInput
        }
    }

    var body: some View {
        Form {
            Section(header: Text("Input")) {
                Picker("Unit", selection: $inputSelection) {
                    ForEach(Temperature.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("Output")) {
                Picker("Unit", selection: $outputSelection) {
                    ForEach(Temperature.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Section() {
                TextField("Enter a temperature", text: $userInput)
                    .keyboardType(.decimalPad)
                Text("\(conversionResult, specifier: "%.2f")")
            }
        }
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
