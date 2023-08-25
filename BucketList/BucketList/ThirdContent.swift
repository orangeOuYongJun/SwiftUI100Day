//
//  ThirdContent.swift
//  BucketList
//
//  Created by OrangeOu on 8/24/23.
//

import SwiftUI
import LocalAuthentication

struct ThirdContent: View {
    @State private var isUnlocked = false

    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    // func
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    // authenticated successfully
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics

        }
    }
}

struct ThirdContent_Previews: PreviewProvider {
    static var previews: some View {
        ThirdContent()
    }
}
