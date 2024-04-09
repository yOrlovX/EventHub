//
//  EventCell.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 08.04.2024.
//

import SwiftUI
import CachedAsyncImage

struct EventCell: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            let  image = event.images[2].url
            CachedAsyncImage(url: URL(string: image), urlCache: .imageCache) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: 218, height: 131)
                    .padding(.horizontal, 9)
                    .padding(.top, 9)
                    .padding(.bottom, 14)
                    .overlay {
                        VStack {
                            HStack(spacing: 0) {
                               
                                Rectangle()
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(.white)
                                    .opacity(0.3)
                                    .cornerRadius(10)
                                    .padding(.leading, 8)
                                    .padding(.top, 8)
                                    .overlay {
                                        VStack {
                                            Text("10")
                                                .foregroundColor(Colors.bookmarkRed)
                                            Text("Jun")
                                                .foregroundColor(Colors.bookmarkRed)
                                        }
                                    }
                               Spacer()
                                Rectangle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .opacity(0.3)
                                    .cornerRadius(10)
                                    .padding(.trailing, 8)
                                    .padding(.top, 8)
                                    .overlay {
                                        SwiftUI.Image(systemName: "bookmark")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 14, height: 14)
                                            .foregroundColor(Colors.bookmarkRed)
                                    }
                            }
                            .frame(width: 218)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                           Spacer()
                        }
                    }
            } placeholder: {
                Color.green
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(event.name)
                    .font(.system(size: 18, weight: .medium))
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 218)
                Text("36 Guild Street London, UK ")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.leading, 9)
            .padding(.bottom, 17)
        }
        .background(.white)
        .cornerRadius(20)
    }
}

//struct EventCell_Previews: PreviewProvider {
//    static var previews: some View {
//        EventCell()
//            .previewLayout(.sizeThatFits)
//    }
//}
