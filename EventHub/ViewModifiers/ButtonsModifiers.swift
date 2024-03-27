//
//  ButtonsModifiers.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 27.03.2024.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.white)
            .frame(width: 281, height: 58)
            .background(Colors.primaryBlue)
            .cornerRadius(15)
    }
}
