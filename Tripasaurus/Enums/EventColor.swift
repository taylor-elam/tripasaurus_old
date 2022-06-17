import SwiftUI

enum EventColor: String, CaseIterable, Identifiable, Codable {
    case red
    case orange
    case yellow
    case green
    case blue
    case magenta
    case darkGray

    static var `default` = EventColor.darkGray

    var id: String { name }
    var mainColor: Color { Color(rawValue) }
    var name: String { rawValue.capitalized }

    static func random() -> EventColor {
        EventColor.allCases.randomElement() ?? .default
    }
}
