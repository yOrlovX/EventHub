//
//  SearchBarView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 11.04.2023.
//

import SwiftUI

struct SearchBarView: View {
  @State var searchText: String = ""
  
  var body: some View {
    HStack {
        SwiftUI.Image(systemName: "magnifyingglass")
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        .foregroundColor(.white)
      TextField("Search...", text: $searchText)
        .padding()
      Rectangle()
        .foregroundColor(Colors.primaryPurple)
        .frame(width: 75, height: 32)
        .cornerRadius(15)
        .overlay {
          HStack(spacing: 4) {
              SwiftUI.Image(systemName: "list.bullet.circle")
              .resizable()
              .scaledToFit()
              .frame(width: 24, height: 24)
              .foregroundColor(.white)
            Text("Filters")
              .font(.system(size: 12))
              .foregroundColor(.white)
          }
          .padding(4)
        }
    }
    .padding(.horizontal, 24)
  }
}

struct SearchBarView_Previews: PreviewProvider {
  static var previews: some View {
    SearchBarView()
  }
}
