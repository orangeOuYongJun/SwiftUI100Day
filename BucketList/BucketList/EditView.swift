//
//  EditView.swift
//  BucketList
//
//  Created by OrangeOu on 9/5/23.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: ViewModel
    
    var onSave: (Location) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby...") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading…")
                    case .success, .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                        
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = viewModel.location
                    newLocation.name = viewModel.name
                    newLocation.description = viewModel.description
                    newLocation.id = UUID()
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await fetchNearbyPlaces()
            }
        }
    }
    
    // method
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.onSave = onSave
        
        _viewModel = StateObject(wrappedValue: ViewModel(location: location))
    }
    
    func fetchNearbyPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(viewModel.location.coordinate.latitude)%7C\(viewModel.location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            viewModel.pages = items.query.pages.values.sorted()
            viewModel.loadingState = .loaded
        } catch {
            viewModel.loadingState = .failed
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example) { newLocation in }
    }
}
