import SwiftUI

enum ExpenseCategory: String {
    case flights = "Flights"
    case transportation = "Transportation"

    var color: Color {
        switch self {
        case .flights: return AppColor.blue.mainColor
        case .transportation: return AppColor.yellow.mainColor
        }
    }
    var name: String { self.rawValue }
}
