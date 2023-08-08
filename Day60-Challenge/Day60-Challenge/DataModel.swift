//
//  DataModel.swift
//  Day60-Challenge
//
//  Created by Yongjun Ou on 8/8/23.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var friends: [Friend]
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var about: String
    var registered: String
    
    var registeredDate: Date {
        let newFormatter = ISO8601DateFormatter()
        return newFormatter.date(from: registered) ?? .now
    }
}

struct Friend: Codable, Identifiable {
    var id: String
    var name: String
}
