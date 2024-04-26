//
//  EventMainCell.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 26.04.2024.
//

import SwiftUI

struct EventMainCell: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let image = event.images.first {
                AsyncImage(url: URL(string: image.url)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 60, height: 200)
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width - 60, height: 200)
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                }
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("\(dateFormatter(date: event.dates.start.localDate))")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.blue)
                
                Text(event.name)
                    .font(.system(size: 15, weight: .medium))
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                HStack(alignment: .top, spacing: 2) {
                    SwiftUI.Image("location")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                    Text(event.embedded.venues.map {$0.name ?? ""}.joined(separator: "•"))
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            Spacer()
        }
        .background(.white)
        .cornerRadius(16)
        .frame(maxWidth: UIScreen.main.bounds.width - 40)
        .padding(.horizontal, 20)
    }
}

extension EventMainCell {
    private func dateFormatter(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: date) {
            formatter.dateFormat = "d MMMM, yyyy"
            return formatter.string(from: date)
        } else {
            return "Date Unknown"
        }
    }
    
    private func timeFormatter(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        formatter.timeZone = TimeZone.current
        
        if let fullDate = formatter.date(from: date) {
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: fullDate)
        } else {
            return "Time Unknown"
        }
    }
}
