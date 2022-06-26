import Foundation

enum AppVault: String {
    case add = "app.add"
    case cancel = "app.cancel"
    case copy = "app.copy"
    case delete = "app.delete"
    case save = "app.save"
    case search = "app.search"

    var name: String { self.rawValue }
}
