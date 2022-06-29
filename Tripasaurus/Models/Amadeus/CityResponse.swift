import Foundation

struct CityResponse: Codable {
    var data: [CityDTO]
    var meta: Meta
}

struct CityDTO: Identifiable, Codable {
    var type: String
    var subType: String
    var name: String
    var iataCode: String?
    var address: CityAddress
    var geoCode: GeoCode
    
    var displayName: String {
        var temp = self.name
        if !address.stateCode.isEmpty {
            temp += ", \(address.stateCode)"
        } else if !address.countryCode.isEmpty {
            temp += ", \(address.countryCode)"
        }
        return temp
    }

    var id: String {
        return "\(self.geoCode.latitude), \(self.geoCode.longitude)"
    }

    struct CityAddress: Codable {
        var countryCode: String
        var stateCode: String
        var postalCode: String?
    }
}
