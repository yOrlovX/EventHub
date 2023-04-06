//
//  SegmentProgressView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 06.04.2023.
//

import SwiftUI

struct SegmentProgressView: View {
  
  @Binding var segmentValue : Int
  var selectedColor: Color = .white
  var unselectedColor: Color = .white.opacity(0.2)
  
  var body: some View {
    HStack(spacing: 8) {
      ForEach(0..<3) { index in
        Circle()
          .frame(width: 13, height: 13)
          .foregroundColor(index < self.segmentValue ? self.selectedColor : self.unselectedColor)
      }
    }
  }
}

struct SegmentProgressView_Previews: PreviewProvider {
    static var previews: some View {
      SegmentProgressView(segmentValue : .constant(3))
    }
}
