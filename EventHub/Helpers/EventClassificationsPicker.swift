//
//  EventClassificationsPicker.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 03.04.2024.
//

import SwiftUI

struct EventClassificationsPicker: View {
    var segments = ["Music", "Sport", "This week"]
    @State private var selectedSegmentIndex = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(0..<segments.count, id: \.self) { index in
                    Button(action: {
                        self.selectedSegmentIndex = index
                    }) {
                        VStack(spacing: 10) {
                            SwiftUI.Image(systemName: self.getImageName(for: index))
                                .resizable()
                                .scaledToFit()
                                .frame(width:30, height: 30)
                                .padding(15)
                                .foregroundColor(index == self.selectedSegmentIndex ? .white : .gray)
                                .background(index == self.selectedSegmentIndex ? Colors.primaryBlue : .white)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(index != self.selectedSegmentIndex ? Color.gray : Color.clear, lineWidth: 2))
                            Text(self.segments[index])
                                .foregroundColor(.black)
                                .font(.system(size: 15))
                        }
                    }
                }
            }
            .padding(.top, 20)
        }
    }
    
    func getImageName(for index: Int) -> String {
        switch index {
        case 0:
            return "music.note"
        case 1:
            return "sportscourt"
        case 2:
            return "calendar"
        default:
            return "heart"
        }
    }
}

struct EventClassificationsPicker_Previews: PreviewProvider {
    static var previews: some View {
        EventClassificationsPicker()
    }
}
