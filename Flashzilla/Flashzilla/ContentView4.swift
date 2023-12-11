//
//  ContentView4.swift
//  Flashzilla
//
//  Created by OrangeOu on 12/11/23.
//

import SwiftUI

struct ContentView4: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
