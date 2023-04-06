//
//  SplashView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
      ZStack {
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 242, height: 58)
      }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
