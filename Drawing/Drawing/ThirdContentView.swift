//
//  ThirdContentView.swift
//  Drawing
//
//  Created by Yongjun Ou on 7/18/23.
//

import SwiftUI

struct ThirdContentView: View {
    @State private var colorCycle = 0.0

    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            Slider(value: $colorCycle)
            Text("\(colorCycle)")
        }
    }
}

struct ThirdContentView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdContentView()
    }
}
