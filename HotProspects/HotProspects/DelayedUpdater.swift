//
//  DelayedUpdater.swift
//  HotProspects
//
//  Created by OrangeOu on 11/6/23.
//

import Foundation
import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i), execute: DispatchWorkItem(block: {
                self.value += 1
            }))
        }
    }
}
