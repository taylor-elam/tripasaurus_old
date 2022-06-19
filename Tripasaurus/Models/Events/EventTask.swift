import Foundation

struct EventTask: Identifiable, Hashable {
    var id: UUID = UUID()

    var isCompleted: Bool = false
    var isDeleted: Bool = false
    var title: String = ""
}

extension EventTask {
    static var example: EventTask = EventTask(isCompleted: false, title: "Food for 4 meals")
}
