//
//  AuthenticationView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 08.05.2024.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            if userViewModel.isUserLogOut {
                SignInView()
            } else {
                MainView()
            }
        }
        .onAppear {
            let authUser = try? AuthenticationService.shared.getAuthenticatedUser()
            self.userViewModel.isUserLogOut = authUser == nil
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
