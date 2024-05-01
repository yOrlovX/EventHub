//
//  DateService.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 01.05.2024.
//

import Foundation

final class DateService: ObservableObject {
    
    func monthFormatter(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: date) {
            formatter.dateFormat = "MMM"
            return formatter.string(from: date)
        } else {
            return "Date Unknown"
        }
    }
    
    func dayFormatter(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: date) {
            formatter.dateFormat = "dd"
            return formatter.string(from: date)
        } else {
            return "Date Unknown"
        }
    }
    
     func dateFormatter(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: date) {
            formatter.dateFormat = "d MMMM, yyyy"
            return formatter.string(from: date)
        } else {
            return "Date Unknown"
        }
    }
    
     func timeFormatter(date: String) -> String {
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
