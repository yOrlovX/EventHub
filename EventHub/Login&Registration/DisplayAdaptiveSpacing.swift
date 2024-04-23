//
//  DisplayAdaptiveSpacing.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 23.04.2024.
//

import Foundation
import SwiftUI
struct DisplayAdaptiveSpacing {
//    let displayHeight: CGFloat = 812
    
    static func adaptiveSpacing() -> CGFloat {
        let displayHeight = UIScreen.main.bounds.size.height
        if displayHeight < 812  {
            return 10
        } else {
            return 30
        }
    }
}
