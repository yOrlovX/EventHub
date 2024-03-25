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
  
  private let clientId = "MzE2MDE2MTF8MTY4MTM5MDE5Ny40OTE4MDIy"
  private let clientSecret = "2011d84c87c5b8538d8c353c0743f88ec2c479a60c09060ca8d2b3de6d8853f6"
  
  init() {
//    getEventsFromLocalJSON()
    getEvents()
  }
  
  private func getEventsFromLocalJSON() {
    guard let url = Bundle.main.url(forResource: "EventsJSON", withExtension: "json") else { return }
    
    URLSession
      .shared
      .dataTaskPublisher(for: url)
      .map { $0.data }
      .receive(on: DispatchQueue.main)
      .decode(type: Events.self, decoder: JSONDecoder())
      .sink { completion in
        switch completion {
        case .finished:
          print("local data was loading")
        case .failure(let error):
          print(error)
        }
      } receiveValue: { [unowned self] returnedData in
        self.events = returnedData.events
      }
      .store(in: &cancellables)
  }
  
  private func getEvents() {
    guard let url = URL(string: "https://api.seatgeek.com/2/events?client_id=\(clientId)&client_secret=\(clientSecret)") else { return }
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
        self?.events = returnedEvents.events
      }
      .store(in: &cancellables)
  }
}
