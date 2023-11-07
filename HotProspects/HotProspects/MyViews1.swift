//
//  MyViews1.swift
//  HotProspects
//
//  Created by OrangeOu on 10/31/23.
//

import SwiftUI

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}
