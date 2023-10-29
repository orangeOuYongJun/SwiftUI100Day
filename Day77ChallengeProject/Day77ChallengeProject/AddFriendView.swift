//
//  AddFriendView.swift
//  Day77ChallengeProject
//
//  Created by OrangeOu on 9/11/23.
//

import SwiftUI

struct AddFriendView: View {
    @Binding var persons: [Person]
    @State var name: String = ""
    @Environment(\.dismiss) var dismiss
    @State private var uiimage: UIImage?
    
    var body: some View {
        NavigationView {
            List {
                Section("Enter the name") {
                    TextField("Name: ", text: $name)
                }
                
                
                if let uiimage = uiimage {
                    Image(uiImage: uiimage)
                        .resizable()
                        .scaledToFit()
                }
            }
            .navigationTitle(Text("Add New Friend"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    addNewFriend()
                    dismiss()
                } label: {
                    Text("Add")
                }
            }
            .onAppear {
                
            }
        }
    }
    
    // func
    init(persons: Binding<[Person]>, uiimage: UIImage? = nil) {
        _persons = persons
        _uiimage = State(initialValue: uiimage)
    }
    
    func addNewFriend() {
        let person = Person(name: name)
        persons.append(person)
    }
}

struct AddFriendView_Previews: PreviewProvider {
    @State static var persons = [Person]()
    static var previews: some View {
        AddFriendView(persons: $persons, uiimage: UIImage(named: "acitvate-registration"))
    }
}
