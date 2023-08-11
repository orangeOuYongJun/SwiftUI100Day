//
//  ThirdContent.swift
//  Instafilter
//
//  Created by Yongjun Ou on 8/9/23.
//

import SwiftUI

struct ThirdContent: View {
    @State private var showingImagePicker = false

    var body: some View {
        NavigationView {
            VStack {
                Button("Select Image") {
                   showingImagePicker = true
                }
            }
            .sheet(isPresented: $showingImagePicker) {
//                ImagePicker()
            }
        }
    }
}

struct ThirdContent_Previews: PreviewProvider {
    static var previews: some View {
        ThirdContent()
    }
}
