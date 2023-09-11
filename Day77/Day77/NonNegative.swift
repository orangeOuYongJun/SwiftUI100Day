//
//  NonNegative.swift
//  Day77
//
//  Created by OrangeOu on 9/10/23.
//

import Foundation

@propertyWrapper
struct NonNegative<Value: BinaryInteger> {
    var value: Value
    
    init(wrappedValue: Value) {
        if wrappedValue < 0 {
            value = 0
        } else {
            value = wrappedValue
        }
    }
    
    var wrappedValue: Value {
        set {
            if value < 0 {
                value = 0
            }
        }
        get {
            value
        }
    }
}
