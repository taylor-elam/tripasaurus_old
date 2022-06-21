import Foundation

struct Trip: Identifiable, Hashable {
    var id: UUID = UUID()
    var isDeleted: Bool = false
    
    var endDate: Date = Date.now
    var startDate: Date = Date.now
    var title: String = ""

    var flights: [FlightReservation] = []

    var budgetItems: [Double] {
        flights.map { $0.cost }
    }
}

extension Trip {
    static var example = Trip(
        endDate: Date.now.add(days: 55),
        startDate: Date.now.add(days: 45),
        title: "Trip to Paris",
        flights: [
            FlightReservation.example,
            FlightReservation(
                arrivalCity: "Paris",
                arrivalDate: Date.now.add(days: 46).add(hours: 8),
                carrier: "United Airlines",
                confirmationNumber: "",
                cost: 148.99,
                departureCity: "New York, NY",
                departureDate: Date.now.add(days: 45).add(hours: 16),
                flightNumber: "101",
                notes: ""
            )
        ]
    )
}
