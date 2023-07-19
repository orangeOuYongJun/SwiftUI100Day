//
//  ThirdContentView.swift
//  CupcakeCorner
//
//  Created by Yongjun Ou on 7/19/23.
//

import SwiftUI

struct ThirdContentView: View {
    @State private var username = ""
    @State private var email = ""

    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(disableForm)

        }
    }
}

struct ThirdContentView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdContentView()
    }
}
