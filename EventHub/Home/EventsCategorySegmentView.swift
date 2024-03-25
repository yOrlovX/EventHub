//
//  EventsCategorySegmentView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 12.04.2023.
//

import SwiftUI

struct EventsCategorySegmentView: View {
  
  let segmentData = CategoryData.categoryData
    let event: Event
  
  var body: some View {
      HStack {
        ForEach(segmentData) { datum in
          Rectangle()
            .frame(width: 100, height: 50)
            .foregroundColor(datum.color)
            .cornerRadius(10)
            .overlay {
              HStack {
                Image(datum.image)
                  Text(event.type)
                  .foregroundColor(.white)
              }
            }
        }
      }
  }
}

//struct EventsCategorySegmentView_Previews: PreviewProvider {
//  static var previews: some View {
//    EventsCategorySegmentView()
//  }
//}

struct CategoryData: Identifiable {
  let id = UUID()
  let image: String
  let name: String
  let location: String
  let color: Color
  
  static let categoryData: [CategoryData] = [
    CategoryData(image: "sport", name: "Sport", location: "", color: .red),
    CategoryData(image: "music", name: "Music", location: "", color: .orange),
    CategoryData(image: "food", name: "Food", location: "", color: .green)
  ]
}
