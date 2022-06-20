import Foundation

enum AppSymbol: String, CaseIterable, Identifiable {
    case addNew = "plus"
    case airplane = "airplane"
    case delete = "trash"
    case calendar = "calendar"
    case copy = "doc.on.doc"

    var id: String { self.rawValue }
    var name: String { self.rawValue }
}
