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
            if !userViewModel.isUserSignIn {
                SignInView()
            } else {
                MainView()
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
