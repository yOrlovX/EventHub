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

@MainActor
final class EventsViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var places: [Place] = []
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: TicketMaster API
    private let apiKey = "qLltnUhN80jaSPhVddkvvyRu3d9F1fZT"
    
    init() {
        Task {
            try await getEventsFromTicketMaster()
        }
        try? loadAnnotations()
    }
}

//MARK: TicketMaster API calls
extension EventsViewModel {
    
    private func getEventsFromTicketMaster() async throws {
        guard let url = URL(string: "https://app.ticketmaster.com/discovery/v2/events.json?&apikey=\(apiKey)") else { throw EventHubError.invalidURL }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let returnedEvents = try JSONDecoder().decode(Events.self, from: data)
            guard let events = returnedEvents.embedded?.events else { return }
            self.events = events
            try self.loadAnnotations()
        } catch let error {
            throw EventHubError.apiError(error)
        }
    }
    
    func getEventsByCityName(cityName: String) async throws {
        self.events.removeAll()
        
        guard let url = URL(string: "https://app.ticketmaster.com/discovery/v2/events.json?city=\(cityName)&apikey=\(apiKey)") else { throw EventHubError.invalidURL }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let returnedEvents = try JSONDecoder().decode(Events.self, from: data)
            guard let events = returnedEvents.embedded?.events else { return }
            self.events = events
            self.places.removeAll()
            try self.loadAnnotations()
        } catch let error {
            throw EventHubError.apiError(error)
        }
    }
    
    func loadAnnotations() throws {
        for event in events {
            
            guard let venue = event.embedded.venues.first,
                  let latitude = Double(venue.location.latitude),
                  let longitude = Double(venue.location.longitude)
            else { throw EventHubError.invalidCoordinates }
            
            let eventCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            
            let place = Place(name: event.name, coordinate: eventCoordinate)
            places.append(place)
        }
    }
}

//MARK:  Events Genres and Segments filter
extension EventsViewModel {
    
    func uniqueSegments(from classifications: [Classification]) -> [Genre] {
        var uniqueSegments: Set<Genre> = []
        for classification in classifications {
            uniqueSegments.insert(classification.segment)
        }
        return Array(uniqueSegments)
    }
    
    func filterEventsByGenre(for segment: Genre?) -> [Event] {
        if let selectedSegment = segment {
            return events.filter { event in
                return event.classifications.contains { $0.segment == selectedSegment }
            }
        } else {
            return events
        }
    }
}
