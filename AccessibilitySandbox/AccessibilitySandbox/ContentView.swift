//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by OrangeOu on 9/5/23.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]

    @State private var selectedPicture = Int.random(in: 0..<4)
    @State private var value = 10

    var body: some View {
        NavigationView {
            VStack {
                // mark it as not important to acceeiblity system
                Image(decorative: pictures[selectedPicture])
                    // hide the control from acceeiblity system
                    .accessibilityHidden(true)
                
                Image(pictures[selectedPicture])
                    .resizable()
                    .scaledToFit()
                    // content for VoiceOver to read
                    .accessibilityLabel(labels[selectedPicture])
                    // describe the behavior of the control
                    .accessibilityAddTraits(.isButton)
                    .accessibilityRemoveTraits(.isImage)
                    .onTapGesture {
                        selectedPicture = Int.random(in: 0..<4)
                    }
                
                VStack {
                    Text("Your score is")
                    Text("1000")
                        .font(.title)
                }
                // control the group accessibility
                .accessibilityElement(children: .ignore)
                // provide another label for the group
                .accessibilityLabel("Your score is 1000")
                
                VStack {
                    Text("Value: \(value)")

                    Button("Increment") {
                        value += 1
                    }

                    Button("Decrement") {
                        value -= 1
                    }
                }
                .accessibilityElement()
                .accessibilityValue(String(value))
                .accessibilityAdjustableAction { dir in
                    switch dir {
                    case .decrement:
                        value -= 1
                    case .increment:
                        value += 1
                    default:
                        print("Not handled.")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
