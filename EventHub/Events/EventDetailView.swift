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
//            let performerImage = event.performers.first?.image ?? ""
//            CachedAsyncImage(url: URL(string: performerImage), urlCache: .imageCache) { image in
//                image
//                    .resizable()
//                    .scaledToFill()
////                    .frame(maxWidth: 218, maxHeight: 131)
//                    .cornerRadius(12)
//                    .padding(10)
//            } placeholder: {
//                ProgressView()
//            }
            
            let image = event.images.first?.url ?? ""
            CachedAsyncImage(url: URL(string: image), urlCache: .imageCache) { image in
                image
                    .resizable()
                    .scaledToFill()
//                    .frame(maxWidth: 218, maxHeight: 131)
                    .cornerRadius(12)
                    .padding(10)
            } placeholder: {
                ProgressView()
            }
        }
        .ignoresSafeArea(edges: .top)
        VStack(alignment: .leading, spacing: 20) {
          Text("International Band Music Concert")
            .font(.system(size: 35))
          HStack(spacing: 14) {
              SwiftUI.Image("eventDate")
              .resizable()
              .scaledToFit()
              .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 1) {
              Text("14 December, 2021")
                .font(.system(size: 16, weight: .medium))
              
              Text("Tuesday, 4:00PM - 9:00PM")
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
              Text("Gala Convention Center")
                .font(.system(size: 16, weight: .medium))
              
              Text("36 Guild Street London, UK ")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            }
          }
          
          VStack(alignment: .leading, spacing: 8) {
            Text("About Event")
              .font(.system(size: 18, weight: .medium))
            
            Text("Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...")
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
