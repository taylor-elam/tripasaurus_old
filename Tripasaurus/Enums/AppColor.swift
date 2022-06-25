import SwiftUI

enum AppColor: String, CaseIterable, Identifiable, Codable {
    case red
    case orange
    case yellow
    case green
    case blue
    case magenta
    case darkGray

    static var `default` = AppColor.darkGray

    var id: String { name }
    var mainColor: Color { Color(rawValue) }
    var name: String { rawValue.capitalized }

    static func random() -> AppColor {
        AppColor.allCases.randomElement() ?? .default
    }
}
