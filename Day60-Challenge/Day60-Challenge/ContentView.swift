//
//  ContentView.swift
//  Day60-Challenge
//
//  Created by Yongjun Ou on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var users = [User]()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>

    var body: some View {
        NavigationView {
            VStack {
                List(cachedUsers) { user in
                    NavigationLink {
                        DetailView(user: user)
                    } label: {
                        Text(user.wrappedName)
                    }
                }
            }
            .task {
                if users.count == 0 {
                    await requestData()
                }
                
                await MainActor.run {
                    for user in users {
                        let newUser = CachedUser(context: moc)
                        newUser.name = user.name
                        newUser.about = user.about
                        newUser.id = user.id
                        
                        for friend in user.friends {
                            let newFriend = CachedFriend(context: moc)
                            newFriend.id = friend.id
                            newFriend.name = friend.name
                            newFriend.user = newUser
                        }
                        
                        try? moc.save()
                    }
                }
            }
        }
    }
    
    // request data
    func requestData() async {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("Invalid data")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
