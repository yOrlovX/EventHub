//
//  EventHubErrors.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 10.05.2024.
//

import Foundation

enum EventHubError: Error, LocalizedError {
    case invalidURL
    case apiError(Error)
    case invalidCoordinates
    case createUserError(Error)
    case userSignInError(Error)
    case userSignOutError(Error)
    
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The url was invalid"
        case .apiError(let error):
            return error.localizedDescription
        case .invalidCoordinates:
            return "Invalid coordinates for event"
        case .createUserError(let error):
            return error.localizedDescription
        case .userSignInError(let error):
            return error.localizedDescription
        case .userSignOutError(let error):
            return error.localizedDescription
        }
    }
}
