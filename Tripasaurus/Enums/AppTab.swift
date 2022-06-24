import SwiftUI

enum AppTab: Int, CaseIterable, Identifiable, Codable {
    case trips
    case events

    var id: Int { rawValue }
    @ViewBuilder var content: some View {
        switch self {
        case .trips: TripListView()
        case .events: EventListView()
        }
    }
    var icon: String {
        switch self {
        case .trips: return AppSymbol.flight.name
        case .events: return AppSymbol.calendar.name
        }
    }
    var tag: Int { rawValue }
    var title: String {
        switch self {
        case .trips: return "Trips"
        case .events: return "Date Planner"
        }
    }
}
