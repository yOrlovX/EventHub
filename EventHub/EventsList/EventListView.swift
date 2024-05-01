//
//  EventListView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 22.04.2024.
//

import SwiftUI

struct EventListView: View {
    @EnvironmentObject var eventsViewModel: EventsViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    LazyVStack {
                        ForEach(eventsViewModel.events, id: \.self) { event in
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
