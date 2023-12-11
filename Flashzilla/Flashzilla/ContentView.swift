//
//  ContentView.swift
//  Flashzilla
//
//  Created by OrangeOu on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var mainContent = "Hello, world!"
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
//        VStack {
//            Text("Hello world!!!")
//                .rotationEffect(currentAmount + finalAmount)
////                .scaleEffect(finalAmount + currentAmount)
////                .onTapGesture {
////                    mainContent = "Tap!!!"
////                }
////                .onLongPressGesture(minimumDuration: 2) {
//////                    mainContent = "Long press!!!"
////                    print("joran")
////                } onPressingChanged: { inProgress in
////                    mainContent = "In process: \(inProgress)"
////                }
////                .gesture(MagnificationGesture()
////                    .onChanged({ amount in
////                        currentAmount = amount - 1
////                    })
////                        .onEnded({ amount in
////                            finalAmount += currentAmount
////                            currentAmount = 0
////                        })
////                )
//                .gesture(RotationGesture()
//                    .onChanged({ angle in
//                        currentAmount = angle
//                    })
//                        .onEnded({ angle in
//                            finalAmount += currentAmount
//                            currentAmount = .zero
//                        })
//                )
//        }
//        .padding()
//        VStack {
//            Text("Hello World")
//                .gesture(
//                    TapGesture()
//                        .onEnded({
//                            print("child gesture")
//                        })
//                )
//        }
//        .highPriorityGesture(
//            TapGesture()
//                .onEnded({
//                    print("parent gesture")
//                })
//        )
//        .simultaneousGesture(
//            TapGesture()
//                .onEnded({
//                    print("parent gesture")
//                })
//        )
        
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { value in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combine = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combine)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
