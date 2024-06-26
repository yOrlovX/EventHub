//
//  EventDetailView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 13.04.2023.
//

import SwiftUI
import Foundation

struct EventDetailView: View {
    
    @EnvironmentObject var dateService: DateService
    
    @Environment(\.router) var router
    
    let event: Event
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                ZStack(alignment: .top) {
                    let image = event.images[2].url
                    AsyncImage(url: URL(string: image)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: geo.size.height * 0.33)
                    } placeholder: {
                        ProgressView()
                    }
                }
                .ignoresSafeArea(edges: .top)
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(event.name)
                            .font(.system(size: 35))
                        HStack(spacing: 14) {
                            SwiftUI.Image("eventDate")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48, height: 48)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("\(dateService.dateFormatter(date: event.dates.start.localDate))")
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("\(dateService.timeFormatter(date:event.dates.start.localTime ?? ""))")
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
                                Text(event.embedded.venues.map {$0.name ?? ""}.joined(separator: ""))
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text(event.embedded.venues.map {$0.address.line1}.joined(separator: ""))
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
                                Text(event.promoter?.name ?? "")
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Organizer")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("About Event")
                                .font(.system(size: 18, weight: .medium))
                            
                            Text(event.info ?? "Information not found")
                                .font(.system(size: 16))
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.top, geo.size.height * 0.25)
            }
        }
        VStack {
            Button(action: {router.showScreen(.push) { _ in WebViewPresenter(url: event.url)}}) {
                Text("Buy Ticket")
                    .modifier(PrimaryButtonModifier())
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Rectangle()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.white)
                        .opacity(0.3)
                        .cornerRadius(10)
                        .overlay {
                            SwiftUI.Image(systemName: "bookmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 14.9)
                                .foregroundColor(.white)
                        }
                }
            }
        }
    }
}
