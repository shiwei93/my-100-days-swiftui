//
//  ContentView.swift
//  WeSplit
//
//  Created by shiwei on 2020/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter your name.", text: $name)
                    Text("Your name is \(name)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
