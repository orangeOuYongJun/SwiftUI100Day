//
//  ContentView5.swift
//  HotProspects
//
//  Created by OrangeOu on 11/6/23.
//

import SwiftUI

struct ContentView5: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
//                    Button("Red") {
//                        backgroundColor = .red
//                    }
                    Button(role: .destructive) {
                        backgroundColor = .red
                    } label: {
                        Label("Red", systemImage: "checkmark.circle.fill")
//                            .foregroundColor(.red)
                    }
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
        }
    }
}

struct ContentView5_Previews: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}
