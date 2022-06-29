import Foundation

struct Location: Codable {
    var name: String
    var id: String
    var timeZoneOffset: String
    var iataCode: String
    var geoCode: GeoCoordinates
    
    struct GeoCoordinates: Codable {
        var lat: Double
        var long: Double
    }
}
