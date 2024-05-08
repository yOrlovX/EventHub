//
//  UserViewModel.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 08.05.2024.
//

import Foundation
import Combine

@MainActor
class UserViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var credentialsIsValid = false
    
    private var cancellable = Set<AnyCancellable>()
    
    init () {
        isUserCredintialsValid
            .receive(on: RunLoop.main)
            .assign(to: \.credentialsIsValid, on: self)
            .store(in: &cancellable)
    }
    
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
    
    func logOut() throws {
        try AuthenticationService.shared.signOut()
    }
    
}

extension UserViewModel {
    var isUserEmailValidPublisher: AnyPublisher<Bool, Never> {
        $email
            .map { email in
                let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                return emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
    }
    
    var isUserPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $password
            .map { password in
                return password.count >= 6
            }
            .eraseToAnyPublisher()
    }
    
    var isUserCredintialsValid: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isUserEmailValidPublisher,
                                 isUserPasswordValidPublisher)
        .map { isEmailValid, isPasswordValid in
            return isEmailValid && isPasswordValid
        }
        .eraseToAnyPublisher()
    }
}
