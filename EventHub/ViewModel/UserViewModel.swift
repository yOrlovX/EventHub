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
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var userRepeatedPassword: String = ""
    @Published var isSingInCredentialsValid = false
    @Published var isSingUpCredentialsValid = false
    @Published var isUserSignIn: Bool = false
    
    private var cancellable = Set<AnyCancellable>()
    
    init () {
        checkSignInCredentials()
        checkSignUpCredentials()
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
    
    private func checkSignInCredentials() {
        isUserSingInCredintialsValid
            .receive(on: RunLoop.main)
            .assign(to: \.isSingInCredentialsValid, on: self)
            .store(in: &cancellable)
    }
    
    private func checkSignUpCredentials() {
        isUserSingUpCredintialsValid
            .receive(on: RunLoop.main)
            .assign(to: \.isSingUpCredentialsValid, on: self)
            .store(in: &cancellable)
    }
    
    var isUserNameValidPublisher: AnyPublisher<Bool, Never> {
        $userName
            .map { name in
                return name.count >= 3
            }
            .eraseToAnyPublisher()
    }
    
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
    
    var passwordMatchesPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($password, $userRepeatedPassword)
            .map { password, repeated in
                return password == repeated
            }
            .eraseToAnyPublisher()
    }
    
    var isUserSingInCredintialsValid: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isUserEmailValidPublisher,
                                 isUserPasswordValidPublisher)
        .map { isEmailValid, isPasswordValid in
            return isEmailValid && isPasswordValid
        }
        .eraseToAnyPublisher()
    }
    
    var isUserSingUpCredintialsValid: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(isUserNameValidPublisher,
                                  isUserEmailValidPublisher,
                                  isUserPasswordValidPublisher,
                                  passwordMatchesPublisher)
        .map { isUserNameValid, isEmailValid, isPasswordValid, isUserRepeatedPasswordValid in
            return isUserNameValid && isEmailValid && isPasswordValid && isUserRepeatedPasswordValid
        }
        .eraseToAnyPublisher()
    }
}
