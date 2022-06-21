import Foundation

enum ExpandableRow: String {
    case date
    case endDate
    case icon
    case startDate
    case none

    var value: String { return self.rawValue }
}
