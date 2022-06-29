import Foundation

class AirportResponse: Codable {
    var meta: Meta
    var data: [AirportDTO]
}

struct AirportDTO: Identifiable, Codable {
    var type: String
    var subType: String
    var name: String
    var detailedName: String
    var id: String
    var timeZoneOffset: String
    var iataCode: String
    var geoCode: GeoCode
    var address: AirportAddress
    var analytics: Analytics?
    var `self`: LocationLink

    struct AirportAddress: Codable {
        var cityName: String
        var cityCode: String
        var countryName: String
        var countryCode: String
        var regionCode: String
        var stateCode: String?
    }

    struct Analytics: Codable {
        var travelers: TravelerAnalytics
        
        struct TravelerAnalytics: Codable {
            var score: Int
        }
    }
    
    struct LocationLink: Codable {
        var methods: [String]
        var href: String
    }
}
