//
//  EventListCell.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 22.04.2024.
//

import SwiftUI

struct EventListCell: View {
    var body: some View {
        HStack(spacing: 18) {
            SwiftUI.Image("jazz")
                .resizable()
                .scaledToFit()
                .frame(width: 79)
                .cornerRadius(10)
                .padding(.leading, 8)
                .padding(.vertical, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Wed, Apr 28 • 5:30 PM")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.blue)
                
                Text("Jo Malone London’s Mother’s Day Presents")
                    .font(.system(size: 15, weight: .medium))
                
                HStack(spacing: 2) {
                    SwiftUI.Image("location")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                    Text("Radius Gallery • Santa Cruz, CA")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(.gray)
                }
            }
            .padding(.trailing, 8)
            .padding(.vertical, 10)
        }
        .background(.white)
        .opacity(0.5)
        .cornerRadius(16)
        .frame(maxWidth: UIScreen.main.bounds.width - 48)
        .frame(maxHeight: 106)
    }
}

struct EventListCell_Previews: PreviewProvider {
    static var previews: some View {
        EventListCell()
            .previewLayout(.sizeThatFits)
    }
}
