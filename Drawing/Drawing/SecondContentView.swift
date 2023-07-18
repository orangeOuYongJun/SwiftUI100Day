//
//  SecondContentView.swift
//  Drawing
//
//  Created by Yongjun Ou on 7/18/23.
//

import SwiftUI

struct SecondContentView: View {
    var body: some View {
//        Text("Hello World")
//            .frame(width: 300, height: 300)
////            .border(ImagePaint(image: Image("singapore"), scale: 0.2), width: 30)
//            .border(ImagePaint(image: Image("singapore"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
        Capsule()
            .strokeBorder(ImagePaint(image: Image("singapore"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)

    }
}

struct SecondContentView_Previews: PreviewProvider {
    static var previews: some View {
        SecondContentView()
    }
}
