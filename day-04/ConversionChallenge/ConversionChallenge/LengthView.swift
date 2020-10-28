//
//  LengthView.swift
//  ConversionChallenge
//
//  Created by shiwei on 2020/10/26.
//

import SwiftUI

enum Length: String, CaseIterable {
    case meters = "Meters"
    case kilometers = "Kilometers"
    case feet = "Feet"
    case yards = "Yards"
    case miles = "Miles"
}

struct LengthView: View {
    @State private var inputSelection = Length.meters
    @State private var outputSelection = Length.meters

    @State private var userInput = ""

    var conversionResult: Double {
        let userInput = Double(self.userInput) ?? 0
        let selection = (inputSelection, outputSelection)
        return userInput
    }

    var body: some View {
        Form {
            Section(header: Text("Input")) {
                Picker("Unit", selection: $inputSelection) {
                    ForEach(Length.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("Output")) {
                Picker("Unit", selection: $outputSelection) {
                    ForEach(Length.allCases, id: \.self) {
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

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}
