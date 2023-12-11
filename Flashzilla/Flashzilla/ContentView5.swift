//
//  ContentView5.swift
//  Flashzilla
//
//  Created by OrangeOu on 12/11/23.
//

import SwiftUI

struct ContentView5: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct ContentView5_Previews: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}
