//
//  ContentView2.swift
//  Flashzilla
//
//  Created by OrangeOu on 12/5/23.
//

import SwiftUI

struct ContentView2: View {
    @Environment(\.colorSchemeContrast) var colorSchemeContrast: ColorSchemeContrast

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }

            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(Rectangle())
                .onTapGesture {
                    print("Circle tapped!")
                }
                .allowsHitTesting(false)
        }
//        VStack {
//            Text("Hello")
//            Spacer()
//                .frame(height: 100)
//            Text("World")
//                .allowsHitTesting(false)
//        }
//        .contentShape(Rectangle())
//        .onTapGesture {
//            print("VStack tapped!")
//        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
