import Foundation

struct ExpenseReport: Identifiable {
    var id: UUID = UUID()
    var category: ExpenseCategory
    var total: Double
    var items: [ExpenseItem]
}

struct ExpenseItem: Identifiable {
    var id: UUID = UUID()
    var title: String
    var cost: Double
    var symbol: String
}
