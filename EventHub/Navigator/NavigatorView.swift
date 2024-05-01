//
//  NavigatorView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 25.03.2024.
//

import SwiftUI
import SwiftfulRouting

struct NavigatorView: View {
    
    @StateObject var eventsViewModel = EventsViewModel()
    
    var body: some View {
        RouterView { _ in
            SplashView()
        }
        .environmentObject(eventsViewModel)
    }
}

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
//        navigationBar.tintColor = .black
    }
}
