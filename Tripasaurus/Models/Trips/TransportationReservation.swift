import Foundation

struct TransportationReservation: Identifiable, Hashable {
    var id: UUID = UUID()
    var isDeleted: Bool = false

    var arrivalCity: String = ""
    var arrivalDate: Date = Date.now
    var carrier: String = ""
    var confirmationNumber: String = ""
    var cost: Double = 0.0
    var departureCity: String = ""
    var departureDate: Date = Date.now
    var routeNumber: String = ""
    var notes: String = ""
}

extension TransportationReservation {
    static var example = TransportationReservation(
        arrivalCity: "Chicago, IL",
        arrivalDate: Date.now.add(days: 45).hour(9).minute(34),
        carrier: "Amtrak",
        confirmationNumber: "ABC123",
        cost: 25.00,
        departureCity: "Milwaukee, WI",
        departureDate: Date.now.add(days: 45).hour(8).minute(5),
        routeNumber: "332 Hiawatha",
        notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    )
}
