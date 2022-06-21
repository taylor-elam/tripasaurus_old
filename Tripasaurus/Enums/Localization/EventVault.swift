import Foundation

enum EventVault: String {
    case add = "event.add"
    case date = "event.date"
    case delete = "event.delete"
    case `new` = "event.new"
    case taskAdd = "event.task.add"
    case taskDescription = "event.task.description"
    case taskSectionTitle = "event.task.sectionTitle"

    var name: String { self.rawValue }
}
