import Foundation

enum EventSection: String, CaseIterable, Identifiable {
    case today = "Today"
    case tomorrow = "Tomorrow"
    case nextSevenDays = "Next 7 Days"
    case nextThirtyDays = "Next 30 Days"
    case future = "Future"
    case past = "Past"

    var id: String { self.rawValue }
    var name: String { self.rawValue }
}
