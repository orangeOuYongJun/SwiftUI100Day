//
//  ContentView.swift
//  SelfTesting001
//
//  Created by Yongjun Ou on 7/18/23.
//

import SwiftUI

struct ContentView: View {
    /**
     var tossResult: some View {
     Group {
     if Bool.random() {
     Image("laser-show")
     .resizable()
     .scaledToFit()
     } else {
     Text("Better luck next time")
     .font(.title)
     }
     }
     .frame(width: 400, height: 300)
     }
     */
    
    @ViewBuilder var tossResult: some View {
        if Bool.random() {
            Image("laser-show")
                .resizable()
                .scaledToFit()
        } else {
            Text("Better luck next time")
                .font(.title)
        }
        
    }


    var body: some View {
        VStack {
            Text("Coin Flip")
                .font(.largeTitle)

            tossResult
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
