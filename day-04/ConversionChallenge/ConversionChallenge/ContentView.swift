//
//  ContentView.swift
//  ConversionChallenge
//
//  Created by shiwei on 2020/10/26.
//

import SwiftUI

enum ConversionSet: Int, CaseIterable {
    case temperature
    case length
    case time
    case volume
}

struct ContentView: View {
    @State private var conversionSet = ConversionSet.temperature

    let option = [
        "Temp",
        "Length",
        "Time",
        "Volume",
    ]

    var body: some View {
        Color(UIColor.systemBackground)
            .ignoresSafeArea()
            .overlay(
                VStack(spacing: 0) {

                    VStack {
                        Text("Cnoversion")
                            .font(.headline)
                            .fontWeight(.semibold)

                        Picker("Unit", selection: $conversionSet) {
                            ForEach(ConversionSet.allCases, id: \.self) {
                                Text(option[$0.rawValue])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding()

                    conversionView
                }
            )
    }

    private var conversionView: some View {
        switch conversionSet {
        case .temperature:
            return AnyView(TemperatureView())
        case .length:
            return AnyView(LengthView())
        case .time:
            return AnyView(TimeView())
        case .volume:
            return AnyView(VolumeView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
