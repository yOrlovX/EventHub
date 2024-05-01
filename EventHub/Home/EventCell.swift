//
//  EventCell.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 08.04.2024.
//

import SwiftUI

struct EventCell: View {
    
    @EnvironmentObject var dateService: DateService
    
    let event: Event
    let imageWidth: CGFloat = 218
    
    var body: some View {
        ZStack {
            VStack(spacing: 14) {
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
                            HStack(alignment: .top) {
                                Rectangle()
                                    .frame(width: 45, height: 47)
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                                    .cornerRadius(10)
                                    .overlay(alignment: .center) {
                                        VStack(spacing:0) {
                                            Text(dateService.dayFormatter(date:event.dates.start.localDate))
                                                .font(.system(size: 16, weight: .semibold))
                                                .foregroundColor(Colors.bookmarkRed)
                                            Text(dateService.monthFormatter(date: event.dates.start.localDate))
                                                .font(.system(size: 14, weight: .regular))
                                                .foregroundColor(Colors.bookmarkRed)
                                        }
                                    }
                                Spacer()
                                Rectangle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                                    .cornerRadius(10)
                                    .overlay(alignment: .center) {
                                        SwiftUI.Image(systemName: "bookmark")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 14, height: 14)
                                            .foregroundColor(Colors.bookmarkRed)
                                    }
                            }
                            .padding(.top, 16)
                            .padding(.horizontal, 8)
                            .frame(maxWidth: imageWidth)
                        }
                } placeholder: {
                    ProgressView()
                        .frame(width: imageWidth, height: 131)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(event.name)
                        .font(.system(size: 18, weight: .medium))
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: imageWidth, alignment: .leading)
                    Text("\(event.embedded.venues.map { $0.address.line1 }.joined(separator: ", ")), \(event.embedded.venues.map { $0.city.name }.joined(separator: ", "))")
                        .font(.system(size: 13))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: imageWidth, alignment: .leading)
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 34)
            }
        }
        .background(.white)
        .cornerRadius(18)
    }
}
