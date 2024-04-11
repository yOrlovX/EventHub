//
//  EventCell.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 08.04.2024.
//

import SwiftUI

struct EventCell: View {
    let event: Event
    let imageWidth: CGFloat = 218
    
    var body: some View {
        ZStack {
            let  image = event.images[2].url
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageWidth, height: 131)
                    .cornerRadius(10)
                    .clipped()
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                    .overlay(alignment: .top) {
                        HStack(alignment: .top, spacing: 0) {
                                VStack(spacing:0) {
                                    Text("10")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(Colors.bookmarkRed)
                                        .padding(.top, 5)
                                        .padding(.horizontal, 10)
                                    Text("Jun")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(Colors.bookmarkRed)
                                        .padding(.bottom, 5)
                                }
                                .background(.white)
                                .opacity(0.7)
                                .cornerRadius(10)
                               Spacer()
                                SwiftUI.Image(systemName: "bookmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(Colors.bookmarkRed)
                                    .padding(8)
                                    .background(.white)
                                    .opacity(0.7)
                                    .cornerRadius(10)
                            }
                            .frame(maxWidth: imageWidth)
                    }
            } placeholder: {
                ProgressView()
            }
//            VStack(alignment: .leading, spacing: 10) {
//                Text(event.name)
//                    .font(.system(size: 18, weight: .medium))
//                    .fixedSize(horizontal: false, vertical: true)
//                    .frame(width: 218)
//                Text("36 Guild Street London, UK ")
//                    .font(.system(size: 13))
//                    .foregroundColor(.gray)
//                    .fixedSize(horizontal: false, vertical: true)
//            }
//            .padding(.leading, 9)
//            .padding(.bottom, 17)
        }
        .background(.white)
        .cornerRadius(18)
    }
}

//struct EventCell_Previews: PreviewProvider {
//    static var previews: some View {
//        EventCell()
//            .previewLayout(.sizeThatFits)
//    }
//}
