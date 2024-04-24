//
//  MapView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var viewModel = EventsViewModel()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.0902, longitude: 95.7129), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: viewModel.places) {
            MapPin(coordinate: $0.coordinate)
        }
        .ignoresSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
