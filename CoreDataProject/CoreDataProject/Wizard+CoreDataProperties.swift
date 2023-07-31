//
//  Wizard+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Yongjun Ou on 7/31/23.
//
//

import Foundation
import CoreData


extension Wizard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wizard> {
        return NSFetchRequest<Wizard>(entityName: "Wizard")
    }

    @NSManaged public var name: String?

}

extension Wizard : Identifiable {

}
