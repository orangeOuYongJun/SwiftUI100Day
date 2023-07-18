//
//  FifthContentView.swift
//  Drawing
//
//  Created by Yongjun Ou on 7/18/23.
//

import SwiftUI

struct FifthContentView: View {
    @State private var insetAmount = 50.0
    
    var body: some View {
//        Trapezoid(insetAmount: insetAmount)
//            .frame(width: 200, height: 100)
//            .onTapGesture {
//                withAnimation {
//                    insetAmount = Double.random(in: 10...90)
//                }
//            }
        
        Circle()
            .animation(.default, value: insetAmount)
            .frame(width: insetAmount)
            .onTapGesture {
                insetAmount = Double.random(in: 10...90)
            }
        
        
//        MyCircle(animatableData: <#EmptyAnimatableData#>)
//            .fill(.red)
//            .frame(width: insetAmount)
//            .onTapGesture {
//                insetAmount = Double.random(in: 10...90)
//            }
            
            
    }
}

struct MyCircle: Shape {

    var animatableData: EmptyAnimatableData
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addEllipse(in: rect)
        }
    }
}

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: rect.maxY))
            path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        }
    }
}

struct FifthContentView_Previews: PreviewProvider {
    static var previews: some View {
        FifthContentView()
    }
}
