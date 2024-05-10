//
//  TextFieldModifier.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 10.05.2024.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 20)
            .padding(.leading, 50)
            .frame(width: UIScreen.main.bounds.width - 60, height: 56)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 2)
            )
    }
}
