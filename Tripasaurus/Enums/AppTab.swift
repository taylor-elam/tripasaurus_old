import SwiftUI

enum AppTab: Int, CaseIterable, Identifiable, Codable {
    case events

    var id: Int { rawValue }
    @ViewBuilder var content: some View {
        switch self {
        case .events: EventListView()
        }
    }
    var icon: String {
        switch self {
        case .events: return "calendar"
        }
    }
    var tag: Int { rawValue }
    var title: String {
        switch self {
        case .events: return "Date Planner"
        }
    }
}
