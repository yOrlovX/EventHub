//
//  EventsView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct EventsView: View {
    @StateObject var eventViewModel = EventsViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    LazyVStack(spacing: 10) {
                        ForEach(eventViewModel.events, id: \.self) { event in
                            EventMainCell(event: event)
                        }
                    }
                } 
            }
        }
        .background(Colors.lightBg)
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
