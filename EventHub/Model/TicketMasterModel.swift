// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let events = try? JSONDecoder().decode(Events.self, from: jsonData)

import Foundation

// MARK: - Events
struct Events: Codable {
    let embedded: EventsEmbedded
    let links: EventsLinks
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
struct Event: Codable, Hashable {
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    let name: String
    let type: EventType
    let id: String
    let test: Bool
    let url: String
    let locale: Locale
    let images: [Image]
    //    let sales: Sales
    //    let dates: Dates
    let classifications: [Classification]
    //    let promoter: Promoter?
    //    let promoters: [Promoter]?
    let info, pleaseNote: String?
    //    let priceRanges: [PriceRange]?
    //    let products: [Product]?
    //    let seatmap: Seatmap
    //    let accessibility: Accessibility?
    //    let ticketLimit: TicketLimit?
    //    let ageRestrictions: AgeRestrictions?
    //    let ticketing: Ticketing
    //    let links: EventLinks
    //    let embedded: EventEmbedded
    //    let outlets: [Outlet]?
    //    let doorsTimes: DoorsTimes?
    
    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, images, info, pleaseNote, classifications
        
    }
}

// MARK: - Accessibility
struct Accessibility: Codable {
    let info: String?
    let ticketLimit: Int
    let url: String?
    let urlText: String?
}

// MARK: - AgeRestrictions
struct AgeRestrictions: Codable {
    let legalAgeEnforced: Bool
}

// MARK: - Classification
struct Classification: Codable {
    let primary: Bool
    let segment, genre, subGenre: Genre
    let type, subType: Genre?
    let family: Bool
}

// MARK: - Genre
struct Genre: Codable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Genre, rhs: Genre) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    let id, name: String
}

// MARK: - Dates
struct Dates: Codable {
    let start: Start
    let timezone: Timezone?
    let status: Status
    let spanMultipleDays: Bool
    let initialStartDate: DoorsTimes?
}

// MARK: - DoorsTimes
struct DoorsTimes: Codable {
    let localDate, localTime: String
    let dateTime: Date
}

// MARK: - Start
struct Start: Codable {
    let localDate, localTime: String
    let dateTime: Date
    let dateTBD, dateTBA, timeTBA, noSpecificTime: Bool
}

// MARK: - Status
struct Status: Codable {
    let code: Code
}

enum Code: String, Codable {
    case onsale = "onsale"
    case rescheduled = "rescheduled"
}

enum Timezone: String, Codable {
    case americaChicago = "America/Chicago"
    case americaLosAngeles = "America/Los_Angeles"
    case americaNewYork = "America/New_York"
    case americaPhoenix = "America/Phoenix"
}

// MARK: - EventEmbedded
struct EventEmbedded: Codable {
    let venues: [Venue]
    let attractions: [Attraction]
}

// MARK: - Attraction
struct Attraction: Codable {
    let name: String
    let type: AttractionType
    let id: String
    let test: Bool
    let url: String
    let locale: Locale
    let externalLinks: ExternalLinks
    let aliases: [String]?
    let images: [Image]
    let classifications: [Classification]
    let upcomingEvents: [String: Int]
    let links: AttractionLinks
    
    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, externalLinks, aliases, images, classifications, upcomingEvents
        case links = "_links"
    }
}

// MARK: - ExternalLinks
struct ExternalLinks: Codable {
    let twitter, wiki: [Facebook]?
    let facebook: [Facebook]
    let instagram: [Facebook]?
    let homepage: [Facebook]
    let youtube, itunes, lastfm, spotify: [Facebook]?
    let musicbrainz: [Musicbrainz]?
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
    let ratio: Ratio?
    let url: String
    let width, height: Int
    let fallback: Bool
    let attribution: String?
}

enum Ratio: String, Codable {
    case the16_9 = "16_9"
    case the3_2 = "3_2"
    case the4_3 = "4_3"
}

// MARK: - AttractionLinks
struct AttractionLinks: Codable {
    let linksSelf: First
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - First
struct First: Codable {
    let href: String
}

enum Locale: String, Codable {
    case enUs = "en-us"
}

enum AttractionType: String, Codable {
    case attraction = "attraction"
}

// MARK: - Venue
struct Venue: Codable {
    let name: String
    let type: VenueType
    let id: String
    let test: Bool
    let url: String?
    let locale: Locale
    let images: [Image]?
    let postalCode: String
    let timezone: Timezone
    let city: City
    //    let state: State
    let country: Country
    let address: Address
    let location: Location
    let markets: [Genre]?
    let dmas: [DMA]
    let boxOfficeInfo: BoxOfficeInfo?
    let parkingDetail, accessibleSeatingDetail: String?
    let generalInfo: GeneralInfo?
    let upcomingEvents: UpcomingEvents
    let links: AttractionLinks
    let aliases: [String]?
    let social: Social?
    let ada: Ada?
    
    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, images, postalCode, timezone, city, country, address, location, markets, dmas, boxOfficeInfo, parkingDetail, accessibleSeatingDetail, generalInfo, upcomingEvents
        case links = "_links"
        case aliases, social, ada
    }
}

// MARK: - Ada
struct Ada: Codable {
    let adaPhones, adaCustomCopy, adaHours: String
}

// MARK: - Address
struct Address: Codable {
    let line1: String
}

// MARK: - BoxOfficeInfo
struct BoxOfficeInfo: Codable {
    let phoneNumberDetail: String?
    let openHoursDetail, acceptedPaymentDetail, willCallDetail: String
}

// MARK: - City
struct City: Codable {
    let name: String
}

// MARK: - Country
struct Country: Codable {
    let name: CountryName
    let countryCode: CountryCode
}

enum CountryCode: String, Codable {
    case us = "US"
}

enum CountryName: String, Codable {
    case unitedStatesOfAmerica = "United States Of America"
}

// MARK: - DMA
struct DMA: Codable {
    let id: Int
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
    let handle: String
}

// MARK: - State
//struct State: Codable {
//    let name, stateCode: String
//}

enum VenueType: String, Codable {
    case venue = "venue"
}

// MARK: - UpcomingEvents
struct UpcomingEvents: Codable {
    let tmr, ticketmaster: Int?
    let total, filtered: Int
    
    enum CodingKeys: String, CodingKey {
        case tmr, ticketmaster
        case total = "_total"
        case filtered = "_filtered"
    }
}

// MARK: - EventLinks
struct EventLinks: Codable {
    let linksSelf: First
    let attractions, venues: [First]
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case attractions, venues
    }
}

// MARK: - Outlet
struct Outlet: Codable {
    let url: String
    let type: String
}

// MARK: - PriceRange
struct PriceRange: Codable {
    let type: PriceRangeType
    let currency: Currency
    let min, max: Double
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum PriceRangeType: String, Codable {
    case standard = "standard"
}

// MARK: - Product
struct Product: Codable {
    let name, id: String
    let url: String
    let type: ProductType
    let classifications: [Classification]
}

enum ProductType: String, Codable {
    case parking = "Parking"
    case upsell = "Upsell"
}

// MARK: - Promoter
struct Promoter: Codable {
    let id: String
    let name: PromoterName
    let description: Description
}

enum Description: String, Codable {
    case liveNationMusicNtlUsa = "LIVE NATION MUSIC / NTL / USA"
    case nbaRegularSeasonNtlUsa = "NBA REGULAR SEASON / NTL / USA"
    case promotedByVenueNtlUsa = "PROMOTED BY VENUE / NTL / USA"
}

enum PromoterName: String, Codable {
    case liveNationMusic = "LIVE NATION MUSIC"
    case nbaRegularSeason = "NBA REGULAR SEASON"
    case promotedByVenue = "PROMOTED BY VENUE"
}

// MARK: - Sales
struct Sales: Codable {
    let salesPublic: Public
    let presales: [Presale]?
    
    enum CodingKeys: String, CodingKey {
        case salesPublic = "public"
        case presales
    }
}

// MARK: - Presale
struct Presale: Codable {
    let startDateTime, endDateTime: Date
    let name: String
}

// MARK: - Public
struct Public: Codable {
    let startDateTime: Date
    let startTBD, startTBA: Bool
    let endDateTime: Date
}

// MARK: - Seatmap
struct Seatmap: Codable {
    let staticURL: String
    
    enum CodingKeys: String, CodingKey {
        case staticURL = "staticUrl"
    }
}

// MARK: - TicketLimit
struct TicketLimit: Codable {
    let info: String
}

// MARK: - Ticketing
struct Ticketing: Codable {
    let safeTix: AllInclusivePricing?
    let allInclusivePricing: AllInclusivePricing
}

// MARK: - AllInclusivePricing
struct AllInclusivePricing: Codable {
    let enabled: Bool
}

enum EventType: String, Codable {
    case event = "event"
}

// MARK: - EventsLinks
struct EventsLinks: Codable {
    let first, linksSelf, next, last: First
    
    enum CodingKeys: String, CodingKey {
        case first
        case linksSelf = "self"
        case next, last
    }
}

// MARK: - Page
struct Page: Codable {
    let size, totalElements, totalPages, number: Int
}
