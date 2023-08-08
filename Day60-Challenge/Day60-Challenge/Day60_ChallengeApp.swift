//
//  Day60_ChallengeApp.swift
//  Day60-Challenge
//
//  Created by Yongjun Ou on 8/8/23.
//

import SwiftUI

@main
struct Day60_ChallengeApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
