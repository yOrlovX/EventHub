//
//  SplashView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct SplashView: View {
  @State private var showOnboarding: Bool = false
  var body: some View {
    ZStack {
      if showOnboarding {
        OnboardingView()
      } else {
        logo
      }
    }
  }
}

extension SplashView {
  
  private var logo: some View {
    ZStack {
        SwiftUI.Image("logo")
        .resizable()
        .scaledToFit()
      .frame(width: 242, height: 58)
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        self.showOnboarding = true
      }
    }
  }
}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    SplashView()
  }
}
