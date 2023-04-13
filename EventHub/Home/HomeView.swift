//
//  HomeView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct HomeView: View {
  @StateObject var eventsViewModel = EventsViewModel()
  
    var body: some View {
      VStack {
        VStack {
          locationContainer
          SearchBarView()
            .padding(.bottom, 46)
        }
        .background(Colors.homeTopbarBg)
        .cornerRadius(33, corners: [.bottomLeft, .bottomRight])
        .edgesIgnoringSafeArea(.top)
        EventsCategorySegmentView()
          .offset(y: -85)
        
        upcomingEventsContainer
        Spacer()
      }
      .background(Colors.lightBg)
    }
}

extension HomeView {
  private var locationContainer: some View {
    HStack {
      Image(systemName: "list.bullet")
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        .foregroundColor(.white)
      Spacer()
      VStack(spacing: 2) {
        Text("Current Location")
          .font(.system(size: 12, weight: .regular))
          .foregroundColor(.white)
        Text("New Yourk, USA")
          .font(.system(size: 13, weight: .medium))
          .foregroundColor(.white)
      }
      Spacer()
      Image(systemName: "bell.badge.circle.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 36, height: 36)
        .foregroundColor(.white)
    }
    .padding(.top, 44)
    .padding(.horizontal, 24)
  }
  
  private var upcomingEventsContainer: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(eventsViewModel.events, id: \.self) { event in
          let performerImage = event.performers.first?.image ?? ""
          UpcomingEventCell(image: performerImage, name: event.shortTitle, location: event.venue.address)
        }
      }
      .padding(.horizontal)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
