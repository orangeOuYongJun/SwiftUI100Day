//
//  ContentView.swift
//  Day77
//
//  Created by OrangeOu on 9/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var res: Double = 0
    @NonNegative var score = 0
    
    var body: some View {
        VStack {
            Button {
                res = 3 / 2
            } label: {
                Text("Action")
            }

            Text("result is \(res)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
