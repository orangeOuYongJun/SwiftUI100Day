//
//  ContentView6.swift
//  HotProspects
//
//  Created by OrangeOu on 11/6/23.
//

import SwiftUI

struct ContentView6: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button {
                        print("Hi")
                    } label: {
                        Label("Send message", systemImage: "message")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct ContentView6_Previews: PreviewProvider {
    static var previews: some View {
        ContentView6()
    }
}
