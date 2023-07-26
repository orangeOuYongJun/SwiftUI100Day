//
//  DataController.swift
//  Bookworm
//
//  Created by OrangeOu on 7/23/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    // prepare(not load) the core data file
    let container = NSPersistentContainer(name: "Bookworm")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
