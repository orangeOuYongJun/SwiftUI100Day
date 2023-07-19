//
//  User.swift
//  CupcakeCorner
//
//  Created by Yongjun Ou on 7/19/23.
//

import Foundation

enum CodingKeys: CodingKey {
    case name
}

class User: ObservableObject, Codable {
    @Published var name = "Paul Hudson"

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: CodingKeys.name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: CodingKeys.name)
    }
}


