//
//  ContentView.swift
//  Day60-Challenge
//
//  Created by Yongjun Ou on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            VStack {
                List(users) { user in
                    NavigationLink {
                        DetailView(user: user)
                    } label: {
                        Text(user.name)
                    }
                }
            }
            .task {
                if users.count == 0 {
                    await requestData()
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
