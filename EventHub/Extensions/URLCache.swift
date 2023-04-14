//
//  URLCache.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 14.04.2023.
//

import Foundation

extension URLCache {
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}
