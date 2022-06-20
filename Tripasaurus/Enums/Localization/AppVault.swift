import Foundation

enum AppVault: String {
    case add = "app.add"
    case cancel = "app.cancel"
    case copy = "app.copy"
    case save = "app.save"

    var name: String { self.rawValue }
}
