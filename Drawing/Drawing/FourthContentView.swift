//
//  FourthContentView.swift
//  Drawing
//
//  Created by Yongjun Ou on 7/18/23.
//

import SwiftUI

struct FourthContentView: View {
    @State private var amount = 0.0

    var body: some View {
//        ZStack {
//            Image("Avatar 2018")
//            Rectangle()
//                .fill(.red)
//                .blendMode(.multiply)
//        }
//        .frame(width: 400, height: 400)
//        .clipped()
        
//        Image("Avatar 2018")
//            .colorMultiply(.red)

        VStack {
            ZStack {
                Circle()
                    .fill(.red)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Image("Avatar 2018")
                .resizable()
//                .blendMode(.screen)

            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct FourthContentView_Previews: PreviewProvider {
    static var previews: some View {
        FourthContentView()
    }
}
