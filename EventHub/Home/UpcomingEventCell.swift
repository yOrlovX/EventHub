//
//  UpcomingEventCell.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 12.04.2023.
//

import SwiftUI
import CachedAsyncImage

struct UpcomingEventCell: View {
    let event: Event
    
    var body: some View {
        VStack {
            VStack(spacing: 14) {
                let image = event.images[2].url 
                CachedAsyncImage(url: URL(string: image), urlCache: .imageCache) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: UIScreen.main.bounds.width - 20, maxHeight: 131)
                        .cornerRadius(12)
                        .padding(10)
                } placeholder: {
                    ProgressView()
                }
                Text(event.name)
                    .font(.system(size: 18, weight: .medium))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 218)
//                Text(event.venue.city)
//                    .font(.system(size: 13))
//                    .foregroundColor(.gray)
            }
            .padding(10)
        }
        .background(.white)
        .cornerRadius(20)
    }
}

//struct UpcomingEventCell_Previews: PreviewProvider {
//  static var previews: some View {
//    UpcomingEventCell(image: "hands", name: "International Band", location: "Loca")
//  }
//}


