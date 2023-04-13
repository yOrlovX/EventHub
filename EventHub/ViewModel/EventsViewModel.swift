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
  
  
  init() {
    getEventsFromLocalJSON()
  }
  
  private func getEventsFromLocalJSON() {
    guard let url = Bundle.main.url(forResource: "EventsJSON", withExtension: "json") else { return }
    
    URLSession
      .shared
      .dataTaskPublisher(for: url)
      .map { $0.data }
      .receive(on: DispatchQueue.main)
      .decode(type: EventsResponse.self, decoder: JSONDecoder())
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
}
