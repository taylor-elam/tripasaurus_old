import SwiftUI

enum ExpenseCategory: String {
    case flights = "Flights"
    case transportation = "Transportation"

    var color: Color {
        switch self {
        case .flights: return EventColor.blue.mainColor
        case .transportation: return EventColor.yellow.mainColor
        }
    }
    var name: String { self.rawValue }
}
