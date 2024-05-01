//
//  MapView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var eventsViewModel: EventsViewModel
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.052235, longitude: -118.243683), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    @State private var currentPage = 0
    
    init() {
        UIScrollView.appearance().isPagingEnabled = true
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: eventsViewModel.places) {
                MapPin(coordinate: $0.coordinate)
            }
            .ignoresSafeArea(.all)
            .overlay {
                VStack {
                    Text("Place for search bar...")
                    Spacer()
                    TabView(selection: $currentPage) {
                        ForEach(eventsViewModel.events.indices, id: \.self) { index in
                            EventListCell(event: eventsViewModel.events[index])
                                .tag(index)
                        }
                    }
                    .frame(maxHeight: 106)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .onChange(of: currentPage) { newPage in
                        print("new page is: \(newPage)")
                        let selectedEvent = eventsViewModel.places[newPage]
                        region.center = CLLocationCoordinate2D(latitude: selectedEvent.coordinate.latitude, longitude: selectedEvent.coordinate.longitude)
                        print("\(selectedEvent.name)")
                    }
                }
            }
            
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
