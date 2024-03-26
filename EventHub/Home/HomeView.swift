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
            
            HStack {
                ForEach(eventsViewModel.events, id: \.self) { event in
                    EventsCategorySegmentView(event: event)
                        .offset(y: -85)
                }
            }
            
            
            
            upcomingEventsContainer
            inviteFriendsContainer
            Spacer()
        }
        .background(Colors.lightBg)
        .navigationBarHidden(true)
    }
}

extension HomeView {
    private var locationContainer: some View {
        HStack {
            SwiftUI.Image(systemName: "list.bullet")
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
            SwiftUI.Image(systemName: "bell.badge.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .foregroundColor(.white)
        }
        .padding(.top, 44)
        .padding(.horizontal, 24)
    }
    
//    private var upcomingEventsContainer: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack {
//                ForEach(eventsViewModel.events, id: \.self) { event in
//                    NavigationLink(destination: EventDetailView(event: event)) {
//                        UpcomingEventCell(event: event)
//                    }
//                }
//                .padding(.horizontal)
//            }
//        }
//    }

    private var upcomingEventsContainer: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(eventsViewModel.events, id: \.self) { event in
                    NavigationLink(destination: EventDetailView(event: event)) {
                        UpcomingEventCell(event: event)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private var inviteFriendsContainer: some View {
        HStack {
            Rectangle()
                .foregroundColor(Colors.turquoiseLight)
                .frame(width: UIScreen.main.bounds.width - 40, height: 127)
                .cornerRadius(12)
                .overlay {
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Invite your friends")
                                .font(.system(size: 18, weight: .medium))
                            
                            Text("Get $20 for ticket")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                            
                            Button(action: {}) {
                                Text("INVITE")
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 5)
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white)
                                    .background(Colors.turquoise)
                                    .cornerRadius(5)
                            }
                        }
                        .padding()
                        SwiftUI.Image("gift")
                            .resizable()
                            .scaledToFit()
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
