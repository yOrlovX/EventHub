//
//  UpcomingEventCell.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 12.04.2023.
//

import SwiftUI
import CachedAsyncImage

struct UpcomingEventCell: View {
  let image: String
  let name: String
  let location: String
  
  var body: some View {
    VStack {
      VStack(spacing: 14) {
        CachedAsyncImage(url: URL(string: image), urlCache: .imageCache) { image in
          image
            .resizable()
            .scaledToFit()
        } placeholder: {
          ProgressView()
        }
        .frame(maxWidth: 218, maxHeight: 131)
        Text(name)
          .font(.system(size: 18, weight: .medium))
          .multilineTextAlignment(.center)
          .fixedSize(horizontal: false, vertical: true)
          .frame(width: 218)
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
