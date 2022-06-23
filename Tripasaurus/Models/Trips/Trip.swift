import Foundation

struct Trip: Identifiable, Hashable {
    var id: UUID = UUID()
    var isDeleted: Bool = false
    
    var endDate: Date = Date.now
    var startDate: Date = Date.now
    var title: String = ""
    var budget: Double = 0.0

    var flights: [FlightReservation] = []
    var transportation: [TransportationReservation] = []

    var expenseItems: [ExpenseItem] {
        var expenseItems: [ExpenseItem] = []

        let flightExpenseItems: [ExpenseItem] = flights.map { ExpenseItem(title: "\($0.carrier) \($0.flightNumber)", cost: $0.cost) }
        expenseItems += flightExpenseItems

        return expenseItems
    }

    var expenseTotal: Double {
        expenseItems.map({ $0.cost }).reduce(0, +)
    }
}

extension Trip {
    static var example = Trip(
        endDate: Date.now.add(days: 55),
        startDate: Date.now.add(days: 45),
        title: "Trip to Paris",
        budget: 1500.0,
        flights: FlightReservation.examples,
        transportation: [TransportationReservation.example]
    )
}
