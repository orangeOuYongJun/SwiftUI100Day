//
//  ContentView.swift
//  HabitTracking
//
//  Created by Yongjun Ou on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    @State var habits = [Habit]()
    @State var shown = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits) { habit in
                    HStack {
                        Text("\(habit.name)")
                        Spacer()
                        Text("\(habit.times) times")
                    }
                }
            }
            .navigationTitle("HabitTracking")
            .toolbar {
                Button("Add") {
                    shown = true
                }
                .sheet(isPresented: $shown) {
                    AddItemView(habits: $habits)
                }
            }
        }
        .onAppear {
            loadData()
        }
    }
    
    /// load data from UserDefault
    func loadData() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
