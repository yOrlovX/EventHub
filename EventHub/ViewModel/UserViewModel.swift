//
//  UserViewModel.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 08.05.2024.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func sighIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password")
            return
        }
//        let returnedUserData = try await AuthenticationService.shared.createUser(email: email, password: password)
        
        //MARK: TASK for using func without async
        Task {
            do {
                let returnedUserData = try await AuthenticationService.shared.createUser(email: email, password: password)
                print("success")
            } catch {
                print("ERROR: \(error)")
            }
        }
    }
    
}
