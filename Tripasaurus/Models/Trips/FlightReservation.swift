import Foundation

struct FlightReservation: Identifiable, Hashable {
    var id: UUID = UUID()
    var isDeleted: Bool = false

    var arrivalCity: String = ""
    var arrivalDate: Date = Date.now
    var carrier: String = ""
    var confirmationNumber: String = ""
    var cost: Double = 0.0
    var departureCity: String = ""
    var departureDate: Date = Date.now
    var flightNumber: String = ""
    var notes: String = ""
}

extension FlightReservation {
    static var example = FlightReservation(
        arrivalCity: "New York, NY",
        arrivalDate: Date.now.add(days: 45).add(hours: 12),
        carrier: "United Airlines",
        confirmationNumber: "A12B34",
        cost: 179.47,
        departureCity: "Chicago, IL",
        departureDate: Date.now.add(days: 45).add(hours: 8),
        flightNumber: "2794",
        notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    )
}
