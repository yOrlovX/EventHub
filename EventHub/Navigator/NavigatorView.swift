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

struct NavigatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatorView()
    }
}
