//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Yongjun Ou on 7/26/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
