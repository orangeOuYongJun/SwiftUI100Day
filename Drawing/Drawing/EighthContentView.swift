//
//  EighthContentView.swift
//  Drawing
//
//  Created by Yongjun Ou on 7/18/23.
//

import SwiftUI

struct Arrow: Shape {
//    var animatableData: Double {
//
//    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        }
    }
}

struct EighthContentView: View {
    @State private var lineW = 10.0
    
    var body: some View {
        Arrow()
            .stroke(style: .init(lineWidth: CGFloat(lineW), lineCap: .round))
            .onTapGesture {
                withAnimation {
                    lineW = Double.random(in: 10..<50)
                }
            }
            .frame(width: 300, height: 300)
            
    }
}

struct EighthContentView_Previews: PreviewProvider {
    static var previews: some View {
        EighthContentView()
    }
}
