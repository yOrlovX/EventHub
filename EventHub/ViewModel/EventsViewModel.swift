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
    
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: TicketMaster API
    private let apiKey = "qLltnUhN80jaSPhVddkvvyRu3d9F1fZT"
    
    init() {
        getEventsFromTicketMaster()
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
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] returnedEvents in
                self?.events = returnedEvents.embedded.events
            }
            .store(in: &cancellables)
    }
}
