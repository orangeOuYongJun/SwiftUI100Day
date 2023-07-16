//
//  ContentView.swift
//  Drawing
//
//  Created by Yongjun Ou on 7/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0

    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .stroke(.red, lineWidth: 1)
                .fill(.red, style: FillStyle(eoFill: true))

            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.bottom, .horizontal])
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding([.bottom, .horizontal])
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Arc: Shape, InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0


    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        }
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/**
 //        ScrollView {
 //            VStack {
 //                Path { path in
 //                    path.move(to: CGPoint(x: 200, y: 100))
 //                    path.addLine(to: CGPoint(x: 100, y: 300))
 //                    path.addLine(to: CGPoint(x: 300, y: 300))
 //                    path.addLine(to: CGPoint(x: 200, y: 100))
 //                    //                path.closeSubpath() // close the path
 //                }
 //                //            .stroke(.blue, lineWidth: 10)
 //                .stroke(.blue, style: .init(lineWidth: 10, lineCap: .round, lineJoin: .round))
 //
 //
 //                Triangle()
 //                    .stroke(.blue, style: .init(lineWidth: 10, lineCap: .round, lineJoin: .round))
 //                    .frame(width: 300, height: 300)
 //
 //                Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
 //                    .stroke(.blue, lineWidth: 10)
 //                    .frame(width: 300, height: 300)
 //
 //                Arc(startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
 //                    .strokeBorder(.blue, lineWidth: 40)
 //                    .frame(width: 300, height: 300)
 //
 //            }
 //        }
 //        .padding()
 //        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
 //            .strokeBorder(.blue, lineWidth: 40)

 */
