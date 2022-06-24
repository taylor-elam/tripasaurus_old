import Foundation

struct Trip: Identifiable, Hashable {
    var id: UUID = UUID()
    var isDeleted: Bool = false
    
    var endDate: Date = Date.now
    var startDate: Date = Date.now
    var title: String = ""
    var budget: Double = 0.0

    var transportation: [TransportReservation] = []

    var expenseItems: [ExpenseItem] {
        var expenseItems: [ExpenseItem] = []

        let transportationExpenseItems: [ExpenseItem] = transportation
            .filter { !$0.isDeleted }
            .sorted { $0.departureDate < $1.departureDate }
            .map {
            ExpenseItem(
                title: "\($0.carrier) \($0.routeNumber)",
                cost: $0.cost,
                symbol: $0.mode == .flight ? AppSymbol.flight.name : AppSymbol.transportation.name
            )
        }

        expenseItems += transportationExpenseItems
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
        transportation: TransportReservation.examples
    )
}
