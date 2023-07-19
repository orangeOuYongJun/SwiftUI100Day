//
//  SecondContentView.swift
//  CupcakeCorner
//
//  Created by Yongjun Ou on 7/19/23.
//

import SwiftUI

struct SecondContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let img = phase.image {
                img
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
    }
}

struct SecondContentView_Previews: PreviewProvider {
    static var previews: some View {
        SecondContentView()
    }
}
