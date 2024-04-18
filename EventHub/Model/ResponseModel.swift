// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let events = try? JSONDecoder().decode(Events.self, from: jsonData)

import Foundation

// MARK: - Events
struct Events: Codable {
    let embedded: EventsEmbedded
    let links: Links
    let page: Page
    
    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }
}

// MARK: - EventsEmbedded
struct EventsEmbedded: Codable {
    let events: [Event]
}

// MARK: - Event
struct Event: Codable {
    let name: String
    let type: String
    let id: String
    let test: Bool
    let url: String
    let images: [Image]
    //    let sales: Sales
    let dates: Dates
    let classifications: [Classification]
    let outlets: [Outlet]?
    let seatmap: Seatmap?
    //    let ticketing: Ticketing
    let links: Links
    let embedded: EventEmbedded
    let promoter: Promoter?
    let promoters: [Promoter]?
    let info, pleaseNote: String?
    let priceRanges: [PriceRange]?
    //    let products: [Product]?
    //    let accessibility: Accessibility?
    //    let ticketLimit: TicketLimit?
    //    let ageRestrictions: AgeRestrictions?
    
    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, images, dates, classifications, outlets, seatmap
        case links = "_links"
        case embedded = "_embedded"
        case promoter, promoters, info, pleaseNote, priceRanges
    }
}

// MARK: - Accessibility
struct Accessibility: Codable {
    let ticketLimit: Int
    let id: String
}

enum AccessibilityID: String, Codable {
    case accessibility = "accessibility"
}

// MARK: - AgeRestrictions
struct AgeRestrictions: Codable {
    let legalAgeEnforced: Bool
    let id: AgeRestrictionsID
}

enum AgeRestrictionsID: String, Codable {
    case ageRestrictions = "ageRestrictions"
}

// MARK: - Classification
struct Classification: Codable {
    let primary: Bool
    let segment, genre, subGenre: Genre
    let type, subType: Genre?
    let family: Bool
}

// MARK: - Genre
struct Genre: Codable {
    let id, name: String
}

// MARK: - Dates
struct Dates: Codable {
    let start: Start
    let status: Status
    let spanMultipleDays: Bool
    let timezone: String?
    let initialStartDate: InitialStartDate?
}

// MARK: - InitialStartDate
struct InitialStartDate: Codable {
    let localDate, localTime: String
    let dateTime: String?
}

// MARK: - Start
struct Start: Codable {
    let localDate: String
    let localTime: String?
    let dateTime: String?
    let dateTBD, dateTBA, timeTBA, noSpecificTime: Bool
}

// MARK: - Status
struct Status: Codable {
    let code: String
}

// MARK: - EventEmbedded
struct EventEmbedded: Codable {
    let venues: [Venue]
    let attractions: [Attraction]
}

// MARK: - Attraction
struct Attraction: Codable {
    let name: String
    let type: String?
    let id: String
    let test: Bool
    let url: String?
    let externalLinks: ExternalLinks?
    let images: [Image]
    let classifications: [Classification]
    let upcomingEvents: [String: Int]
    let links: Links
    let aliases: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, externalLinks, images, classifications, upcomingEvents
        case links = "_links"
        case aliases
    }
}

// MARK: - ExternalLinks
struct ExternalLinks: Codable {
    let twitter: [Twitter]?
    let wiki: [Facebook]?
    let facebook: [Facebook]?
    let instagram: [Instagram]?
    let homepage: [Homepage]?
    let youtube: [Youtube]?
    let itunes: [Itunes]?
    let lastfm: [Lastfm]?
    let spotify: [Spotify]?
    let musicbrainz: [Musicbrainz]?
}

// MARK: - Spotify
struct Spotify: Codable {
    let url: String
}

// MARK: - Lastfm
struct Lastfm: Codable {
    let url: String
}

// MARK: - Itunes
struct Itunes: Codable {
    let url: String
}

// MARK: - Youtube
struct Youtube: Codable {
    let url: String
}

// MARK: - Instagram
struct Homepage: Codable {
    let url: String
}

// MARK: - Instagram
struct Instagram: Codable {
    let url: String
}

// MARK: - Facebook
struct Facebook: Codable {
    let url: String
}

// MARK: - Musicbrainz
struct Musicbrainz: Codable {
    let id: String
}

// MARK: - Image
struct Image: Codable {
    //    let ratio: Ratio?
    let url: String
    let width, height: Int
    let fallback: Bool
    let attribution: String?
}

//enum Ratio: String, Codable {
//    case the16_9 = "16_9"
//    case the3_2 = "3_2"
//    case the4_3 = "4_3"
//}


// MARK: - Venue
struct Venue: Codable {
    let name: String?
    let type: String
    let id: String
    let test: Bool
    let postalCode: String
    let timezone: String
    let city: City
    let country: Country
    let address: Address
    let location: Location
    //    let dmas: [DMA]
    //    let upcomingEvents: UpcomingEvents
    let links: Links
    let url: String?
    let aliases: [String]?
    let images: [Image]?
    let markets: [Genre]?
    let social: Social?
    //    let boxOfficeInfo: BoxOfficeInfo?
    let parkingDetail: String?
    let accessibleSeatingDetail: String?
    let generalInfo: GeneralInfo?
    
    enum CodingKeys: String, CodingKey {
        case name, type, id, test, postalCode, timezone, city, country, address, location
        case links = "_links"
        case url, aliases, images, markets, social, parkingDetail, accessibleSeatingDetail, generalInfo
    }
}

// MARK: - Address
struct Address: Codable {
    let line1: String
}


//enum Alias: String, Codable {
//    case tdBanknorthGarden = "td banknorth garden"
//}

//// MARK: - BoxOfficeInfo
//struct BoxOfficeInfo: Codable {
//    let phoneNumberDetail, openHoursDetail, acceptedPaymentDetail, willCallDetail: String
//}

// MARK: - City
struct City: Codable {
    let name: String
}

// MARK: - Country
struct Country: Codable {
    let name: String
    let countryCode: String
}

// MARK: - GeneralInfo
struct GeneralInfo: Codable {
    let generalRule, childRule: String?
}

// MARK: - Location
struct Location: Codable {
    let longitude, latitude: String
}

// MARK: - Social
struct Social: Codable {
    let twitter: Twitter
}

// MARK: - Twitter
struct Twitter: Codable {
    let handle: String?
}

//// MARK: - EventLinks
//struct EventLinks: Codable {
//    let linksSelf: First
//    let attractions, venues: [First]
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//        case attractions, venues
//    }
//}

// MARK: - Outlet
struct Outlet: Codable {
    let url: String
    let type: String
}

// MARK: - PriceRange
struct PriceRange: Codable {
    let type: String
    let currency: String
    let min, max: Double
}

//// MARK: - Product
//struct Product: Codable {
//    let name, id: String
//    let url: String
//    let type: ProductType
//    let classifications: [Classification]
//}
//
//enum ProductType: String, Codable {
//    case parking = "Parking"
//    case upsell = "Upsell"
//}

// MARK: - Promoter
struct Promoter: Codable {
    let id, name, description: String?
}

//// MARK: - Sales
//struct Sales: Codable {
//    let salesPublic: Public
//    let presales: [Presale]?
//
//    enum CodingKeys: String, CodingKey {
//        case salesPublic = "public"
//        case presales
//    }
//}
//
//// MARK: - Presale
//struct Presale: Codable {
//    let startDateTime, endDateTime: Date
//    let name: String
//}
//
//// MARK: - Public
//struct Public: Codable {
//    let startDateTime: String
//    let startTBD, startTBA: Bool
//    let endDateTime: String
//}

// MARK: - Seatmap
struct Seatmap: Codable {
    let staticURL: String
    let id: String?
    
    enum CodingKeys: String, CodingKey {
        case staticURL = "staticUrl"
        case id
    }
}

//enum SeatmapID: String, Codable {
//    case seatmap = "seatmap"
//}

//// MARK: - TicketLimit
//struct TicketLimit: Codable {
//    let info: String
//    let id: TicketLimitID
//}
//
//enum TicketLimitID: String, Codable {
//    case ticketLimit = "ticketLimit"
//}
//
//// MARK: - Ticketing
//struct Ticketing: Codable {
//    let allInclusivePricing: AllInclusivePricing
//    let safeTix: AllInclusivePricing?
//    let id: TicketingID?
//}
//
//// MARK: - AllInclusivePricing
//struct AllInclusivePricing: Codable {
//    let enabled: Bool
//}
//
//enum TicketingID: String, Codable {
//    case ticketing = "ticketing"
//}

// MARK: - Links
struct Links: Codable {
    let linksSelf: SelfElement
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - SelfElement
struct SelfElement: Codable {
    let href: String
}

// MARK: - Page
struct Page: Codable {
    let size, totalElements, totalPages, number: Int
}

// MARK: - Extensions
extension Event: Hashable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}

extension Genre: Hashable {
    static func == (lhs: Genre, rhs: Genre) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
