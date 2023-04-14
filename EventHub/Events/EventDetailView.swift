//
//  EventDetailView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 13.04.2023.
//

import SwiftUI

struct EventDetailView: View {
  
//  let event: Event
  
    var body: some View {
      VStack {
        ZStack {
          Image("eventDetail")
            .resizable()
            .scaledToFit()
        }
        .ignoresSafeArea()
        Spacer()
        
        VStack(alignment: .leading, spacing: 20) {
          Text("International Band Music Concert")
            .font(.system(size: 35))
          
          HStack(spacing: 14) {
            Image("eventDate")
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
            Image("eventLocation")
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
      }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
