//
//  HomeView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI
import MapItemPicker

struct HomeView: View {
    @EnvironmentObject var eventsViewModel: EventsViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State private var showingPicker = false
    @State private var currentLocation = "New York"
    @State private var selectedSegment: Genre?
    @State private var topBarHeight: CGFloat = UIScreen.main.bounds.height / 4.53
    
    @Environment(\.router) var router
    
    var body: some View {
        ZStack(alignment: .top) {
            Colors.lightBg
            VStack(spacing: 0) {
                topBarContainer
                segmentsContainer
                upcomingEventsContainer
            }
            .ignoresSafeArea(.container, edges: .top)
        }
        .navigationBarHidden(true)
        .mapItemPicker(isPresented: $showingPicker) { item in
            if let name = item?.name {
                print("Selected \(name)")
                currentLocation = name
                Task {
                     try await eventsViewModel.getEventsByCityName(cityName: currentLocation)
                }
            }
        }
    }
}

extension HomeView {
    
    private var segmentsContainer: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 11) {
                let uniqueSegments = eventsViewModel.uniqueSegments(from: eventsViewModel.events.flatMap { $0.classifications })
                ForEach(uniqueSegments.sorted { $0.name > $1.name}, id: \.name) { segment in
                    
                    Button(action: {
                        if selectedSegment == segment {
                            selectedSegment = nil
                        } else {
                            selectedSegment = segment
                        }
                    }) {
                        HStack(spacing: 8) {
                            SwiftUI.Image(segment.name)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 17, height: 17)
                                .padding(.vertical, 10)
                                .padding(.leading, 15)
                            Text(segment.name)
                                .padding(.vertical, 10)
                                .padding(.trailing, 15)
                            
                                .foregroundColor(.white)
                        }
                        .background(segmentColor(segment))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(selectedSegment == segment ? Color.white : Color.clear, lineWidth: 2)
                        )
                    }
                    
                }
            }
            .padding(.horizontal, 24)
        }
    }
    
    func segmentColor(_ genre: Genre) -> Color {
        switch genre.name {
        case "Sports": return Color.red
        case "Music": return Color.orange
        case "Arts & Theatre":  return Color.blue
        default: break
        }
        return Color.green
    }
    
    private var topBarContainer: some View {
        Rectangle()
            .foregroundColor(Colors.homeTopbarBg)
            .frame(maxHeight: topBarHeight)
            .cornerRadius(33, corners: [.bottomLeft, .bottomRight])
            .overlay(alignment: .top) {
                VStack(spacing: 20) {
                    locationContainer
                    searchAndFilterContainer
                }
            }
    }
    
    private var searchAndFilterContainer: some View {
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
        .padding(.horizontal, 24)
    }
    
    private var locationContainer: some View {
        HStack {
            Button(action: {  userViewModel.signOut()
                userViewModel.isUserSignIn = false
                print("USER Sign Out")
            }) {
                SwiftUI.Image(systemName: "list.bullet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
            }
            Spacer()
            Button(action: { showingPicker.toggle()}) {
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
    }
    
    private var upcomingEventsContainer: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Upcoming Events")
                    .font(.system(size: 18, weight: .medium))
                Spacer()
                Button(action: { router.showScreen(.push) { _ in  EventListView()}}) {
                    Text("See All")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 24)
            
            if eventsViewModel.events.isEmpty {
                Text("Events not found")
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        ForEach(eventsViewModel.filterEventsByGenre(for: selectedSegment), id: \.self) { event in
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
                .frame(maxHeight: 250)
            }
        }
    }
}

