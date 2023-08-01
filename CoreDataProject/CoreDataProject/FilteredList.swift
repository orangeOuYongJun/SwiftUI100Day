//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Yongjun Ou on 7/31/23.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(filterKey: String, filterValue: String, sortDescriptor: SortDescriptor<T>, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [sortDescriptor], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

struct User: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "First"
        case lastName = "Last"
    }
    var firstName: String
    var lastName: String
}
//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList(filter: "A")
//    }
//}
