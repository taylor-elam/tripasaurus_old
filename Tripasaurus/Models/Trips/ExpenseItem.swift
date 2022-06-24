import Foundation

struct ExpenseItem: Identifiable {
    var id: UUID = UUID()
    var title: String
    var cost: Double
    var symbol: String
}
