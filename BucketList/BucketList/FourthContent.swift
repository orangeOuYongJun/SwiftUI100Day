//
//  FourthContent.swift
//  BucketList
//
//  Created by OrangeOu on 8/27/23.
//

import SwiftUI
import MapKit

struct FourthContent: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @State private var locations = [Location]()
    @State private var selectedPlace: Location?

    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
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
                            selectedPlace = location
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
                            let location = Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                            locations.append(location)
                            
                        } label: {
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                    }
                }
            }
            .sheet(item: $selectedPlace) { place in
                EditView(location: place) { newLocation in
                    if let index = locations.firstIndex(of: place) {
                        locations[index] = newLocation
                    }
                }
            }
        }
    }
}

struct FourthContent_Previews: PreviewProvider {
    static var previews: some View {
        FourthContent()
    }
}
