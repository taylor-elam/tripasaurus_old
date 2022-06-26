import Foundation

struct AirportLocationsResponse: Codable {
    var meta: Meta
    var data: [Airport]
}

struct Meta: Codable {
    var count: Int
    var links: Link
}

struct Link: Codable {
    var `self`: String
}

struct Airport: Identifiable, Codable {
    var type: String
    var subType: String
    var name: String
    var detailedName: String
    var id: String
    var timeZoneOffset: String
    var iataCode: String
    var geoCode: GeoCode
    var address: Address
    var analytics: Analytics
}

struct Location: Codable {
    var name: String
    var detailedName: String
    var id: String
    var timeZoneOffset: String
    var iataCode: String
    var geoCode: GeoCode
}

struct GeoCode: Codable {
    var latitude: Double
    var longitude: Double
}

struct Address: Codable {
    var cityName: String
    var cityCode: String
    var countryName: String
    var countryCode: String
    var regionCode: String
}

struct Analytics: Codable {
    var travelers: TravelerAnalytics
}

struct TravelerAnalytics: Codable {
    var score: Int
}
