//
//  EventListCell.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 22.04.2024.
//

import SwiftUI

struct EventListCell: View {
    let event: Event
    
    var body: some View {
        HStack(spacing: 18) {
            let image = event.images[2].url
            
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 79, height: 92)
                    .cornerRadius(10)
                    .padding(.leading, 8)
                    .padding(.vertical, 10)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(dateFormatter(date: event.dates.start.localDate))")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.blue)
                
                Text(event.name)
                    .font(.system(size: 15, weight: .medium))
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                HStack(spacing: 2) {
                    SwiftUI.Image("location")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                    Text(event.embedded.venues.map {$0.name ?? ""}.joined(separator: "•"))
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                }
            }
            .padding(.trailing, 8)
            .padding(.vertical, 10)
            Spacer()
        }
        .background(.white)
        .cornerRadius(16)
        .frame(maxWidth: UIScreen.main.bounds.width - 48)
    }
}

extension EventListCell {
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
