//
//  Place.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 05.04.2024.
//

import Foundation
import MapKit

struct Place: Identifiable {
    var id = UUID().uuidString
    var placemark: CLPlacemark
}
