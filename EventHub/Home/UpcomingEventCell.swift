//
//  UpcomingEventCell.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 12.04.2023.
//

import SwiftUI

struct UpcomingEventCell: View {
  let image: String
  let name: String
  let location: String
  
  var body: some View {
    VStack {
      VStack(spacing: 14) {
        Image(image)
          .resizable()
          .scaledToFit()
          .frame(maxHeight: 131)
        Text(name)
          .font(.system(size: 18, weight: .medium))
        Text(location)
          .font(.system(size: 13))
          .foregroundColor(.gray)
      }
      .padding(10)
    }
    .background(.white)
    .cornerRadius(20)
  }
}

struct UpcomingEventCell_Previews: PreviewProvider {
  static var previews: some View {
    UpcomingEventCell(image: "hands", name: "International Band", location: "Loca")
  }
}


struct UpcomingEventsData: Identifiable {
  let id = UUID()
  let image: String
  let eventName: String
  let eventLocation: String
  
  static let mockEvents: [UpcomingEventsData] = [
    UpcomingEventsData(image: "hands", eventName: "hands", eventLocation: "36 Guild Street London, UK"),
    UpcomingEventsData(image: "woman", eventName: "woman", eventLocation: "36 Guild Street London, UK"),
    UpcomingEventsData(image: "girl", eventName: "girl", eventLocation: "36 Guild Street London, UK"),
    UpcomingEventsData(image: "jazz", eventName: "jazz", eventLocation: "36 Guild Street London, UK"),
    UpcomingEventsData(image: "festival", eventName: "fiestval", eventLocation: "36 Guild Street London, UK"),
  ]
}
