//
//  EventDetailView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 13.04.2023.
//

import SwiftUI
import CachedAsyncImage

struct EventDetailView: View {
  
  let event: Event
  
    var body: some View {
      VStack {
        ZStack {            
            let image = event.images[2].url
            CachedAsyncImage(url: URL(string: image), urlCache: .imageCache) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 244)
            } placeholder: {
                ProgressView()
            }
        }
        .ignoresSafeArea(edges: .top)
        VStack(alignment: .leading, spacing: 20) {
            Text(event.name)
            .font(.system(size: 35))
          HStack(spacing: 14) {
              SwiftUI.Image("eventDate")
              .resizable()
              .scaledToFit()
              .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 1) {
                Text(event.dates.start.localDate)
                .font(.system(size: 16, weight: .medium))
              
                Text(event.dates.start.localTime ?? "")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            }
          }
          HStack(spacing: 14) {
              SwiftUI.Image("eventLocation")
              .resizable()
              .scaledToFit()
              .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 1) {
                Text(event.embedded.venues.map {$0.name}.joined(separator: ""))
                .font(.system(size: 16, weight: .medium))
              
              Text("36 Guild Street London, UK ")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            }
          }
          
          VStack(alignment: .leading, spacing: 8) {
            Text("About Event")
              .font(.system(size: 18, weight: .medium))
            
              Text(event.pleaseNote ?? "")
              .font(.system(size: 16))
          }
        }
        .padding()
        Spacer()
        Spacer()
      }
    }
}

//struct EventDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventDetailView()
//    }
//}
