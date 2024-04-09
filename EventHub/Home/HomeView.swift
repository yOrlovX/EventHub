//
//  HomeView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI
import MapItemPicker

struct HomeView: View {
    @StateObject var eventsViewModel = EventsViewModel()
    @State private var showingPicker = false
    @State private var currentLocation = "New Yourk, USA"
    
    @Environment(\.router) var router
    
    var body: some View {
        ZStack {
            Colors.lightBg
                .ignoresSafeArea(.all)
            VStack {
                topBarContainer
                segmentsContainer
                    .offset(y: -80)
                VStack(alignment: .leading, spacing: 30) {
                    Section("Upcoming Events") {
                        upcomingEventsContainer
                    }
                    .font(.system(size: 18, weight: .medium))
                }
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}


extension HomeView {
    
    private var segmentsContainer: some View {
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
    }
    
    private var topBarContainer: some View {
        VStack {
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
                    Text(currentLocation)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    showingPicker = true
                }
                .mapItemPicker(isPresented: $showingPicker) { item in
                    if let name = item?.name {
                        print("Selected \(name)")
                        currentLocation = name
                    }
                }
                Spacer()
                Circle()
                    .frame(width: 36, height: 36)
                    .foregroundColor(Colors.primaryPurple)
                    .overlay {
                        SwiftUI.Image(systemName: "bell.badge")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                    }
            }
            .padding(.top, 44)
            .padding(.horizontal, 24)
            HStack {
                SearchBarView()
                Button(action: { router.showScreen(.sheet) { _ in
                    FilterView()
                }}) {
                    Rectangle()
                        .foregroundColor(Colors.primaryPurple)
                        .frame(width: 75, height: 32)
                        .cornerRadius(15)
                        .overlay {
                            HStack(spacing: 3) {
                                SwiftUI.Image(systemName: "list.bullet.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 23, height: 23)
                                    .foregroundColor(.white)
                                    .padding(.leading, 4)
                                    .padding(.vertical, 4)
                                Text("Filters")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                                    .padding(.trailing, 4)
                            }
                        }
                }
            }
            .padding(.bottom, 44)
            .padding(.horizontal, 24)
        }
        .background(Colors.homeTopbarBg)
        .cornerRadius(33, corners: [.bottomLeft, .bottomRight])
        .edgesIgnoringSafeArea(.top)
    }
    
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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(eventsViewModel.events, id: \.self) { event in
                    EventCell(event: event)
                        .onTapGesture {
                            router.showScreen(.push) { _ in
                                EventDetailView(event: event)
                            }
                        }
                }
            }
            .padding(.horizontal, 24)
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
