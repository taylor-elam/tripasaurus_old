import Foundation

struct Trip: Identifiable, Hashable {
    var id: UUID = UUID()
    var isDeleted: Bool = false
    
    var endDate: Date = Date.now
    var startDate: Date = Date.now
    var title: String = ""
    var budget: Double = 0.0

    var transportation: [TransportReservation] = []

    var expenseTotal: Double {
        expenseReports.map({ $0.total }).reduce(0, +)
    }

    var expenseReports: [ExpenseReport] {
        var flightExpenseReport = ExpenseReport(category: .flights, total: 0.0, items: [])
        var transportExpenseReport = ExpenseReport(category: .transportation, total: 0.0, items: [])

        transportation.forEach({ reservation in
            let isFlight = reservation.mode == .flight
            let expenseItem = ExpenseItem(
                title: "\(reservation.carrier) \(reservation.routeNumber)",
                cost: reservation.cost,
                symbol: isFlight ? AppSymbol.flight.name : AppSymbol.transportation.name
            )
            if isFlight {
                flightExpenseReport.total += expenseItem.cost
                flightExpenseReport.items.append(expenseItem)
            } else {
                transportExpenseReport.total += expenseItem.cost
                transportExpenseReport.items.append(expenseItem)
            }
        })

        return [flightExpenseReport, transportExpenseReport]
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
