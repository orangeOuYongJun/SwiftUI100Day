//
//  SecondContent.swift
//  BucketList
//
//  Created by OrangeOu on 8/24/23.
//

import SwiftUI
import MapKit

//struct SecondContent: View {
//    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
//    
//    let locations = [
//        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
//        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
//    ]
//
//    var body: some View {
//        NavigationView {
//            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
////                MapMarker(coordinate: location.coordinate)
//                MapAnnotation(coordinate: location.coordinate) {
////                    Circle()
////                        .stroke(.red, lineWidth: 3)
////                        .frame(width: 44, height: 44)
////                        .onTapGesture {
////                            print("Tapped on \(location.name)")
////                        }
//                    NavigationLink {
//                        Text(location.name)
//                    } label: {
//                        Circle()
//                            .stroke(.red, lineWidth: 3)
//                            .frame(width: 44, height: 44)
//                    }
//
//                }
//            }
//        }
//        .navigationTitle("London Explorer")
//    }
//}
//
//struct SecondContent_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondContent()
//    }
//}
