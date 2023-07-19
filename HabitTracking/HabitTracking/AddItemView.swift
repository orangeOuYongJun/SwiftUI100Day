//
//  AddItemView.swift
//  HabitTracking
//
//  Created by Yongjun Ou on 7/19/23.
//

import SwiftUI

struct AddItemView: View {
    @State var name: String = ""
    @State var times: Int = 0
    @State var desc: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var habits: [Habit]

    var body: some View {
        NavigationView {
            List {
                TextField("Habit Name", text: $name)
                Stepper("Completion times: \(times)", value: $times)
                TextField("Description", text: $desc)
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Finish") {
                    if name != "" {
                        habits.append(Habit(name: name, times: times, desc: desc))
                    }
                    dismiss()
                }
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        let thingToPreview = [Habit]()
        AddItemView(habits: .constant(thingToPreview))
    }
}
