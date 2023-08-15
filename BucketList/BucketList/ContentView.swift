//
//  ContentView.swift
//  BucketList
//
//  Created by Yongjun Ou on 8/15/23.
//

import SwiftUI

struct User: Identifiable, Comparable {
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.firstName < rhs.firstName
    }
    
    let id = UUID()
    let firstName: String
    let lastName: String
}

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}


struct ContentView: View {
    @State var textContent = "status01"
    
    @State var loadingState = LoadingState.loading
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Act") {
                    loadingState = .success
                }
                switch loadingState {
                case .loading:
                    LoadingView()
                case .success:
                    SuccessView()
                case .failed:
                    FailedView()
                }
            }
        }
    }
    
    // func
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 let users = [
     User(firstName: "Arnold", lastName: "Rimmer"),
     User(firstName: "Kristine", lastName: "Kochanski"),
     User(firstName: "David", lastName: "Lister"),
 ].sorted()

 var body: some View {
     VStack {
         List(users) { user in
             Text("\(user.lastName), \(user.firstName)")
         }
     }
     .padding()
 }

 */

/**
 Text(textContent)
     .onTapGesture {
         let str = "Test Message"
         let url = getDocumentsDirectory().appending(path: "message.txt")
         
         do {
             try str.write(to: url, atomically: true, encoding: .utf8)
             let input = try String(contentsOf: url)
             textContent = input
         } catch {
             print(error.localizedDescription)
         }
         
     }

 */
