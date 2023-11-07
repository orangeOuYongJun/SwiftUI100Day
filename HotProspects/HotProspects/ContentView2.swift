//
//  ContentView2.swift
//  HotProspects
//
//  Created by OrangeOu on 11/6/23.
//

import SwiftUI

struct ContentView2: View {
    @StateObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
