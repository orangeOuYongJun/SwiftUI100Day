//
//  ContentView.swift
//  Bookworm
//
//  Created by OrangeOu on 7/23/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title, order: .reverse),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack(spacing: 18) {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                }
                .onDelete { index in
                    deleteBooks(at: index)
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    // func
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]

            // delete it from the context
            moc.delete(book)
        }
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 NavigationView {
 VStack {
 Toggle("Remember Me", isOn: $rememberMe)
 Text(rememberMe ? "On" : "Off")
 TextEditor(text: $notes)
 .padding()
 }
 }
 */

/**
 @State private var rememberMe = false
 @AppStorage("notes") var notes = ""
 
 @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
 /// current managed object context
 @Environment(\.managedObjectContext) var moc
 
 var body: some View {
 NavigationView {
 VStack {
 List(students) { student in
 Text(student.name ?? "Unknown")
 }
 }
 .toolbar {
 Button("Add") {
 let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
 let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
 
 let chosenFirstName = firstNames.randomElement()!
 let chosenLastName = lastNames.randomElement()!
 
 let student = Student(context: moc)
 student.id = UUID()
 student.name = "\(chosenFirstName) \(chosenLastName)"
 
 try? moc.save()
 }
 }
 }
 }
 
 */
