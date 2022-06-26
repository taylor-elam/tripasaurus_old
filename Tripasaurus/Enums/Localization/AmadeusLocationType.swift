import Foundation

enum AmadeusLocationType: String {
    case airport = "AIRPORT"
    case city = "CITY"

    var name: String { self.rawValue }
}
