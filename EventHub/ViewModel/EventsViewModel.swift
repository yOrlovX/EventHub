//
//  EventsViewModel.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 13.04.2023.
//

import Foundation
import SwiftUI
import Combine

final class EventsViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: SeatGeak API
    private let clientId = "MzE2MDE2MTF8MTY4MTM5MDE5Ny40OTE4MDIy"
    private let clientSecret = "2011d84c87c5b8538d8c353c0743f88ec2c479a60c09060ca8d2b3de6d8853f6"
    
    //MARK: TicketMaster API
    private let apiKey = "qLltnUhN80jaSPhVddkvvyRu3d9F1fZT"
    
    init() {
        getEventsFromTicketMaster()
    }
}


//MARK: SeatGeak API
//extension EventsViewModel {
//
//    private func getEventsFromLocalJSON() {
//        guard let url = Bundle.main.url(forResource: "EventsJSON", withExtension: "json") else { return }
//
//        URLSession
//            .shared
//            .dataTaskPublisher(for: url)
//            .map { $0.data }
//            .receive(on: DispatchQueue.main)
//            .decode(type: Events.self, decoder: JSONDecoder())
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    print("local data was loading")
//                case .failure(let error):
//                    print(error)
//                }
//            } receiveValue: { [unowned self] returnedData in
//                self.events = returnedData.events
//            }
//            .store(in: &cancellables)
//    }
//
//    private func getEvents() {
//        guard let url = URL(string: "https://api.seatgeek.com/2/events?client_id=\(clientId)&client_secret=\(clientSecret)") else { return }
//        URLSession
//            .shared
//            .dataTaskPublisher(for: url)
//            .map { $0.data }
//            .receive(on: DispatchQueue.main)
//            .decode(type: Events.self, decoder: JSONDecoder())
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    print("loaded request data")
//                case .failure(let error):
//                    print(error)
//                }
//            } receiveValue: { [weak self] returnedEvents in
//                self?.events = returnedEvents.events
//            }
//            .store(in: &cancellables)
//    }
//}

//MARK: TicketMaster API
extension EventsViewModel {
    
    private func getEventsFromTicketMaster() {
        guard let url = URL(string: "https://app.ticketmaster.com/discovery/v2/events.json?city=boston&apikey=qLltnUhN80jaSPhVddkvvyRu3d9F1fZT") else { return }
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
