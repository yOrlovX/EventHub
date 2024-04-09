//
//  NavigatorView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 25.03.2024.
//

import SwiftUI
import SwiftfulRouting

struct NavigatorView: View {
    var body: some View {
        RouterView { _ in
            SplashView()
        }
    }
}

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
        navigationBar.tintColor = .white
    }
}
