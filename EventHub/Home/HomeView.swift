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
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 11) {
                    ForEach(uniqueSegments(from: eventsViewModel.events.flatMap { $0.classifications }), id: \.name) { segment in
                        Text(segment.name)
                            .padding(10)
                            .background(Color.green)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 24)
            }
            .offset(y: -85)
            
            
            upcomingEventsContainer
                .padding(.top, -70)
            
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
                HStack {
                    Text("Current Location")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.white)
                    SwiftUI.Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .frame(width: 10, height: 5)
                        .foregroundColor(.white)
                }
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
    
    private var upcomingEventsContainer: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(eventsViewModel.events, id: \.self) { event in
                    NavigationLink(destination: EventDetailView(event: event)) {
                        UpcomingEventCell(event: event)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private func uniqueSegments(from classifications: [Classification]) -> [Genre] {
        var uniqueSegments: Set<Genre> = []
        
        for classification in classifications {
            uniqueSegments.insert(classification.segment)
        }
        
        return Array(uniqueSegments)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
