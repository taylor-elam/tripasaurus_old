import Foundation

struct Event: Identifiable, Hashable {
    var id: UUID = UUID()

    var color: EventColor = EventColor.random()
    var date: Date = Date.now
    var icon: EventIcon = EventIcon.random()
    var isDeleted: Bool = false
    var tasks: [EventTask] = []
    var title: String = ""
}

extension Event {
    var emptyTaskCount: Int { tasks.filter { $0.title.isEmpty }.count }
    var remainingTaskCount: Int { tasks.filter { !$0.isCompleted }.count }
    var isComplete: Bool { tasks.allSatisfy { $0.isCompleted } }
    
    var isPast: Bool { date.startOfDay < Date.now.startOfDay }
    var isToday: Bool { date.startOfDay == Date.now.startOfDay }
    var isTomorrow: Bool { date.startOfDay == Date.now.startOfDay.add(days: 1) }
    var isWithinSevenDays: Bool { date.startOfDay > Date.now.add(days: 1) && date.startOfDay <= Date.now.add(days: 7) }
    var isWithinSevenToThirtyDays: Bool { date.startOfDay > Date.now.add(days: 7) && date.startOfDay <= Date.now.add(days: 30) }
    var isGreaterThanThirtyDays: Bool { date.startOfDay > Date.now.add(days: 30) }
}

extension Event {
    static var example = Event(
        color: .green,
        date: Date.now,
        icon: .leaf,
        tasks: [
            EventTask(isCompleted: true, title: "Find a sleeping bag"),
            EventTask(title: "Bug spray"),
            EventTask(title: "Paper towels"),
            EventTask(title: "Food for 4 meals"),
            EventTask(title: "Straw hat")
        ],
        title: "Camping Trip"
    )
}
