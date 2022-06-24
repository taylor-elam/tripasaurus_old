import Foundation

enum AppSymbol: String, CaseIterable, Identifiable {
    case addNew = "plus"
    case flight = "airplane"
    case arrowRight = "arrow.right"
    case budget = "dollarsign.circle.fill"
    case delete = "trash"
    case calendar = "calendar"
    case checkmark = "checkmark"
    case checkmarkCircle = "checkmark.circle.fill"
    case circle = "circle"
    case copy = "doc.on.doc"
    case transportation = "tram.fill"

    var id: String { self.rawValue }
    var name: String { self.rawValue }
}
