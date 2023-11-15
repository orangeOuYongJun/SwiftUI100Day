//
//  Prospect.swift
//  HotProspects
//
//  Created by OrangeOu on 11/15/23.
//

import Foundation

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send() // send before value change, to ensure the swiftui act normal
        prospect.isContacted.toggle()
    }
}
