//
//  AuthenticationService.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 08.05.2024.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthenticationService {
    static let shared = AuthenticationService()
    
    private init() {}
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return  AuthDataResultModel(user: authDataResult.user)
    }
}

