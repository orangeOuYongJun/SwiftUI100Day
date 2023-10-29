//
//  ContentView.swift
//  Day77ChallengeProject
//
//  Created by OrangeOu on 9/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var persons = [Person]()
    @State private var pickImage: Image?
    @State private var uiimage: UIImage?
    
    @State private var showAddNewContactView = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(persons) { person in
                        Text(person.name)
                    }
                }
                
                
                Section {
                    if showAddNewContactView {
                        AddFriendView(persons: $persons, uiimage: uiimage)
                    }
                }
            }
            .toolbar {
                NavigationLink {
                    ImagePicker(image: $uiimage)
                } label: {
                    Text("Add Photo")
                }
            }
            .navigationTitle(Text("MyProject"))
            .navigationBarTitleDisplayMode(.inline)
            .task {
                if uiimage != nil {
                    await delayText()
                }
            }
        }
    }
    
    // func
    private func delayText() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        showAddNewContactView = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

