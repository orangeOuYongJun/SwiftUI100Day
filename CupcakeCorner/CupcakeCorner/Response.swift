//
//  Response.swift
//  CupcakeCorner
//
//  Created by Yongjun Ou on 7/19/23.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
