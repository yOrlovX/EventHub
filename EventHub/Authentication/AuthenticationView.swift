//
//  AuthenticationView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 08.05.2024.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            if showSignInView {
                SignInView()
            } else {
                MainView()
            }
        }
        .onAppear {
            let authUser = try? AuthenticationService.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
