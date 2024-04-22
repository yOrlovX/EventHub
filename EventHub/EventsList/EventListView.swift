//
//  EventListView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 22.04.2024.
//

import SwiftUI

struct EventListView: View {
    @StateObject var eventViewModel = EventsViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    LazyVStack {
                        ForEach(eventViewModel.events, id: \.self) { event in
                            EventListCell(event: event)
                        }
                    }
                }
            }
        }
        .background(Colors.lightBg)
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
