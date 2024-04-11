//
//  MainView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct MainView: View {
    
    init() {
        UITabBar.appearance().tintColor = UIColor(Colors.bookmarkRed)
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Explore", systemImage: "safari.fill")
                }
            EventsView()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
            
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
