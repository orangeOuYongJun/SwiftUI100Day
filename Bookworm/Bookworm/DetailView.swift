//
//  DetailView.swift
//  Bookworm
//
//  Created by OrangeOu on 7/25/23.
//

import SwiftUI
import CoreData

struct DetailView: View {
    let book: Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Image(book.genre ?? "Fantasy")
                        .resizable()
                        .scaledToFit()
                    
                    Text(book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                
                Text(book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)

                Text(book.review ?? "No review")
                    .padding()

                RatingView(rating: .constant(Int(book.rating)))
                    .font(.largeTitle)
                
                if let date = book.date {
                    Text(date, format: .dateTime)
                        .font(.footnote)
                        .padding()
                }
            }
            .navigationTitle(book.title ?? "Unknown Book")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Delete book", isPresented: $showingDeleteAlert) {
                Button("Delete", role: .destructive, action: deleteBook)
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Are you sure?")
            }
            .toolbar(content: {
                Button {
                    showingDeleteAlert.toggle()
                } label: {
                    Label("Delete this book", systemImage: "trash")
                }
            })

        }
    }
    // func
    func deleteBook() {
        moc.delete(book)
        try? moc.save()
        dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."
        
        return DetailView(book: book)
    }
}
