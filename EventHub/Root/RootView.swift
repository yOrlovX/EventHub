//
//  NavigatorView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 25.03.2024.
//

import SwiftUI
import SwiftfulRouting

struct RootView: View {
    
    @StateObject var eventsViewModel = EventsViewModel()
    @StateObject var dateService = DateService()
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        RouterView { _ in
            SplashView()
        }
        .environmentObject(eventsViewModel)
        .environmentObject(dateService)
        .environmentObject(userViewModel)
    }
}

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
//        navigationBar.tintColor = .black
    }
}
