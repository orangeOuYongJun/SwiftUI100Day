//
//  Habit.swift
//  HabitTracking
//
//  Created by Yongjun Ou on 7/19/23.
//

import Foundation

struct Habit: Codable, Identifiable {
    var id = UUID()
    var name: String
    var times: Int
    var desc: String
}
