//
//  FourthContent.swift
//  BucketList
//
//  Created by OrangeOu on 8/27/23.
//

import SwiftUI
import MapKit

struct FourthContent: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isUnlocked {
                    Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
    //                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                        MapAnnotation(coordinate: location.coordinate) {
    //                        VStack {
    //                            Image(systemName: "star.circle")
    //                                .resizable()
    //                                .foregroundColor(.red)
    //                                .frame(width: 44, height: 44)
    //                                .background(.white)
    //                                .clipShape(Circle())
    //                        }
                            Text(location.name)
                                .fixedSize()
                            .onTapGesture {
                                viewModel.selectedPlace = location
                            }
                        }
                    }
                    .ignoresSafeArea()
                    
                    Circle()
                        .fill(.blue)
                        .opacity(0.3)
                        .frame(width: 32,
                               height: 32)
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                viewModel.addLocation()
                            } label: {
                                Image(systemName: "plus")
                                    .padding()
                                    .background(.black.opacity(0.75))
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .clipShape(Circle())
                                    .padding(.trailing)
                            }
                        }
                    }
                } else {
                    // not unlock
                    Button("Unlock Places") {
                        viewModel.authenticate()
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
            }
            .sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) { newLocation in
//                    if let index = viewModel.locations.firstIndex(of: place) {
//                        viewModel.locations[index] = newLocation
//                    }
                    viewModel.update(location: newLocation)
                }
            }
            .alert("Authentication failed", isPresented: $viewModel.isAuthenticatedFailed) {
                
            }
                
        }
    }
}

struct FourthContent_Previews: PreviewProvider {
    static var previews: some View {
        FourthContent()
    }
}
