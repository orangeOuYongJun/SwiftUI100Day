//
//  CachedUser+CoreDataProperties.swift
//  Day60-Challenge
//
//  Created by Yongjun Ou on 8/8/23.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var friends: NSSet?
    
    var wrappedName: String {
        name ?? "Unknown"
    }
        
    var wrappedAbout: String {
        about ?? "No data"
    }
    
    var wrappedAddress: String {
        address ?? "Homeless"
    }
    
    var wrappedID: UUID {
        id ?? UUID()
    }
    
    var friendsArray: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
