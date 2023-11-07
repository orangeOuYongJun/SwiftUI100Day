//
//  ContentView8.swift
//  HotProspects
//
//  Created by OrangeOu on 11/6/23.
//

import SwiftUI
import SamplePackage

struct ContentView8: View {
    let possibleNumbers = Array(1...60)
    var results: String {
        // more code to come
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")

    }

    var body: some View {
        Text(results)
    }
}

struct ContentView8_Previews: PreviewProvider {
    static var previews: some View {
        ContentView8()
    }
}
