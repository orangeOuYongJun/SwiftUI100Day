//
//  DetailView.swift
//  Day60-Challenge
//
//  Created by Yongjun Ou on 8/8/23.
//

import SwiftUI

struct DetailView: View {
    @State var user: CachedUser
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Section {
                    Text(user.wrappedAbout)
                } header: {
                    Text("About")
                        .font(.headline)
                }
                
                Section {
                    List(user.friendsArray) { friend in
                        Text(friend.name ?? "")
                    }
                } header: {
                    Text("Friends")
                        .font(.headline)
                }
            }
            .padding()
            .navigationTitle(Text(user.name ?? ""))
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
