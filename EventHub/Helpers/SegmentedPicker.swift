//
//  SegmentedPicker.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 03.04.2024.
//

import SwiftUI

struct SegmentedPicker: View {
    
    var segments = ["Today", "Tomorrow", "This week"]
    @State private var selectedSegmentIndex = 0
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<segments.count, id: \.self) { index in
                Button(action: {
                    self.selectedSegmentIndex = index
                }) {
                    Text(self.segments[index])
                        .padding(9)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(index == self.selectedSegmentIndex ? .white : .gray)
                        .background(index == self.selectedSegmentIndex ? Colors.primaryBlue : .white)
                        .cornerRadius(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(index == self.selectedSegmentIndex ? Colors.primaryBlue : .gray, lineWidth: 1)
                        }
                }
            }
        }
    }
}


struct SegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPicker()
    }
}
