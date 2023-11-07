//
//  ContentView.swift
//  HotProspects
//
//  Created by OrangeOu on 10/29/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var user = User()
    @State private var selectedTab = "One"
    
    var body: some View {
//        VStack {
//            EditView()
//            DisplayView()
//        }
//        .environmentObject(user)
//        .padding()
        
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            
            Text("Tab 2")
                .onTapGesture {
                    selectedTab = "One"
                }
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
