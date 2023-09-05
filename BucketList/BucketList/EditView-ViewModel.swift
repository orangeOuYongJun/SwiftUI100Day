//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by OrangeOu on 9/5/23.
//

import Foundation

extension EditView {
    @MainActor class ViewModel: ObservableObject {
        var location: Location
        
        @Published var name: String
        @Published var description: String
        
        @Published var loadingState = LoadingState.loading
        @Published var pages = [Page]()
        
        init(location: Location) {
            self.location = location
            _name = Published(initialValue: location.name)
            _description = Published(initialValue: location.description)
        }
    }
}
