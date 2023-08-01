//
//  DataModel.swift
//  UserInfos
//
//  Created by Yongjun Ou on 8/1/23.
//

import Foundation

struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var friends: [Friend]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isActive = "isActive"
        case name = "name"
        case age = "age"
        case company = "company"
        case email = "email"
        case address = "address"
        case about = "about"
        case registered = "registered"
        case friends = "friends"
    }
}


struct Friend: Codable {
    var id: String
    var name: String
}
