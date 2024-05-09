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
    @Published var isUserSignIn: Bool = false
    
    private var cancellable = Set<AnyCancellable>()
    
    init () {
        isUserCredintialsValid
            .receive(on: RunLoop.main)
            .assign(to: \.credentialsIsValid, on: self)
            .store(in: &cancellable)
        
        self.isUserSignIn = AuthenticationService.shared.isUserSignedIn()
    }
    
    func sighUp() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password")
            return
        }
        Task {
            do {
                _ = try await AuthenticationService.shared.createUser(email: email, password: password)
                print("User Sign UP")
            } catch {
                print("ERROR: \(error)")
            }
        }
    }
    
    func sighIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password")
            return
        }
        Task {
            do {
                _ = try await AuthenticationService.shared.userSignIn(email: email, password: password)
                print("User sign IN")
            } catch {
                print("ERROR: \(error)")
            }
        }
    }
    
    func signOut() {
        Task {
            do {
                try AuthenticationService.shared.signOut()
            } catch {
                print("LogOutError")
            }
        }
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
