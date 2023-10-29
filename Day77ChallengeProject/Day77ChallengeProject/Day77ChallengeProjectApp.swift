//
//  Day77ChallengeProjectApp.swift
//  Day77ChallengeProject
//
//  Created by OrangeOu on 9/11/23.
//

import SwiftUI

@main
struct Day77ChallengeProjectApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            AddFriendView(persons: .constant([Person]()), uiimage: UIImage(named: "acitvate-registration"))
        }
    }
}
