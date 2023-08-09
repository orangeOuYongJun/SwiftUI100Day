//
//  ContentView.swift
//  Instafilter
//
//  Created by Yongjun Ou on 8/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.white
    @State private var showingConfirmation = false


    var body: some View {
        Button("Tap", action: {
            showingConfirmation = true
        })
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Blue") { backgroundColor = .blue }
            Button("Cancel", role: .cancel) { }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
