//
//  ContentView4.swift
//  HotProspects
//
//  Created by OrangeOu on 11/6/23.
//

import SwiftUI

struct ContentView4: View {
    var body: some View {
        Image("Example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
