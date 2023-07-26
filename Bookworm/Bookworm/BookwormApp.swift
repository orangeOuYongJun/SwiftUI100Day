//
//  BookwormApp.swift
//  Bookworm
//
//  Created by OrangeOu on 7/23/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
            // viewContext can let us do all the changes to the data in memory, instead of to the hard disk
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
