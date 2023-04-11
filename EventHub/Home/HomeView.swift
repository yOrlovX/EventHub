//
//  HomeView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      VStack {
        VStack {
          locationContainer
          SearchBarView()
            .padding(.bottom, 46)
        }
        .background(Colors.homeTopbarBg)
        .cornerRadius(33, corners: [.bottomLeft, .bottomRight])
        .edgesIgnoringSafeArea(.top)
        Spacer()
        
      }
    }
}

extension HomeView {
  private var locationContainer: some View {
    HStack {
      Image(systemName: "list.bullet")
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        .foregroundColor(.white)
      Spacer()
      VStack(spacing: 2) {
        Text("Current Location")
          .font(.system(size: 12, weight: .regular))
          .foregroundColor(.white)
        Text("New Yourk, USA")
          .font(.system(size: 13, weight: .medium))
          .foregroundColor(.white)
      }
      Spacer()
      Image(systemName: "bell.badge.circle.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 36, height: 36)
        .foregroundColor(.white)
    }
    .padding(.top, 44)
    .padding(.horizontal, 24)
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
