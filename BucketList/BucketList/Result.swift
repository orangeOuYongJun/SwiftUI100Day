//
//  Result.swift
//  BucketList
//
//  Created by OrangeOu on 9/5/23.
//

import Foundation

struct Query: Codable {
    let pages: [Int: Page]
}

struct Result: Codable {
    let query: Query
}

struct Page: Codable, Comparable {
    static func < (lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
    
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    var description: String {
        terms?["description"]?.first ?? "No further information"
    }
}
