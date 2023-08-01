//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Yongjun Ou on 7/31/23.
//
//

import Foundation
import CoreData


extension Singer {
    
    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }

    var wrappedLastName: String {
        lastName ?? "Unknown"
    }

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}

extension Singer : Identifiable {

}
