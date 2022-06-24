import Foundation

struct TransportReservation: Identifiable, Hashable {
    var id: UUID = UUID()
    var isDeleted: Bool = false

    var arrivalCity: String = ""
    var arrivalDate: Date = Date.now
    var carrier: String = ""
    var confirmationNumber: String = ""
    var cost: Double = 0.0
    var departureCity: String = ""
    var departureDate: Date = Date.now
    var mode: TransportationMode = .default
    var routeNumber: String = ""
    var notes: String = ""
}

extension TransportReservation {
    static var flightExample = TransportReservation(
        arrivalCity: "New York, NY",
        arrivalDate: Date.now.add(days: 45).hour(22).minute(23),
        carrier: "Delta Airlines",
        confirmationNumber: "AB12CD34",
        cost: 280.15,
        departureCity: "Chicago, IL",
        departureDate: Date.now.add(days: 45).hour(18).minute(45),
        mode: .flight,
        routeNumber: "4746",
        notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    )

    static var transportExample = TransportReservation(
        arrivalCity: "Chicago, IL",
        arrivalDate: Date.now.add(days: 45).hour(9).minute(34),
        carrier: "Amtrak",
        confirmationNumber: "ABC123",
        cost: 25.00,
        departureCity: "Milwaukee, WI",
        departureDate: Date.now.add(days: 45).hour(8).minute(5),
        mode: .train,
        routeNumber: "332 Hiawatha",
        notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    )

    static var examples = [
        transportExample,
        TransportReservation(
            arrivalCity: "Paris",
            arrivalDate: Date.now.add(days: 46).add(hours: 11),
            carrier: "Delta Airlines",
            confirmationNumber: "AB12CD34",
            cost: 280.15,
            departureCity: "New York, NY",
            departureDate: Date.now.add(days: 45).hour(23).minute(50),
            mode: .flight,
            routeNumber: "8742",
            notes: ""
        ),
        flightExample
    ]
}
