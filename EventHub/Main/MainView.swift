//
//  MainView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
      TabView {
        HomeView()
          .tabItem {
            Label("Explore", systemImage: "house.fill")
          }
        EventsView()
          .tabItem {
            Label("Events", systemImage: "calendar")
          }
        
        MapView()
          .tabItem {
            Label("Events", systemImage: "map")
          }
        
        ProfileView()
          .tabItem {
            Label("Profile", systemImage: "person")
          }
      }
      .accentColor(Colors.primaryBlue)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
