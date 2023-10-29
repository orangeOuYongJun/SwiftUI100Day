//
//  Person.swift
//  Day77ChallengeProject
//
//  Created by OrangeOu on 9/11/23.
//

import Foundation
import SwiftUI

struct Person: Identifiable, Codable, Comparable {
    var id = UUID()
    var name: String
    var longtiude : Double?
    var latitude : Double?
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.name < rhs.name
    }
    
    var image: Image? {
        let path = FileManager.default.getDocumentDir.appending(path: id.uuidString + ".jpg").path()
        if let uiimage = UIImage(contentsOfFile: path) {
            return Image(uiImage: uiimage)
        }
        return nil
    }
}
