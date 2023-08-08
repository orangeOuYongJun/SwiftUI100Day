//
//  CachedFriend+CoreDataProperties.swift
//  Day60-Challenge
//
//  Created by Yongjun Ou on 8/8/23.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?

    var wrappedName: String {
        return name ?? "N/A"
    }
}

extension CachedFriend : Identifiable {

}
