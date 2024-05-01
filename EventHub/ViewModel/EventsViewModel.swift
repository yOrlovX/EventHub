//
//  EventsViewModel.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 13.04.2023.
//

import Foundation
import SwiftUI
import Combine
import MapKit

final class EventsViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var places: [Place] = []
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: TicketMaster API
    private let apiKey = "qLltnUhN80jaSPhVddkvvyRu3d9F1fZT"
    
    init() {
        getEventsFromTicketMaster()
        loadAnnotations()
    }
}

//MARK: TicketMaster API
extension EventsViewModel {
    
    private func getEventsFromTicketMaster() {
        guard let url = URL(string: "https://app.ticketmaster.com/discovery/v2/events.json?&apikey=\(apiKey)") else { return }
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .receive(on: DispatchQueue.main)
            .decode(type: Events.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("loaded request data")
                    self.loadAnnotations()
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] returnedEvents in
                self?.events = returnedEvents.embedded.events
            }
            .store(in: &cancellables)
    }
    
    func getEventsByCityName(cityName: String) {
        guard let url = URL(string: "https://app.ticketmaster.com/discovery/v2/events.json?city=\(cityName)&apikey=\(apiKey)") else { return }
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .receive(on: DispatchQueue.main)
            .decode(type: Events.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("loaded request data")
                    self.places.removeAll()
                    self.loadAnnotations()
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] returnedEvents in
                self?.events.removeAll()
                self?.events = returnedEvents.embedded.events
            }
            .store(in: &cancellables)
    }
    
    func loadAnnotations() {
        for event in events {

            guard let venue = event.embedded.venues.first,
                  let latitude = Double(venue.location.latitude),
                  let longitude = Double(venue.location.longitude)
            else {
                print("Invalid coordinates for event: \(event.name)")
                                continue
            }
            let eventCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            
            let place = Place(name: event.name, coordinate: eventCoordinate)
            places.append(place)
        }
    }
}
