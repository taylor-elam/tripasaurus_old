import SwiftUI

class EventStore: ObservableObject {
    @Published var events: [Event] = [
        Event(
            color: .red,
            date: Date.now.add(days: 7),
            icon: .gift,
            tasks: [
                EventTask(title: "Birthday cake"),
                EventTask(title: "Paper cups and plates"),
                EventTask(title: "Cheese plate"),
                EventTask(title: "Party poppers"),
            ],
            title: "Maya's Birthday"
        ),
        Event(
            color: .blue,
            date: Date.now.add(days: 2),
            icon: .cross,
            tasks: [
                EventTask(isCompleted: true, title: "Bring medical ID"),
                EventTask(isCompleted: true, title: "Record heart rate data"),
            ],
            title: "Health Check-up"
        ),
        Event(
            color: .yellow,
            date: Date.now.add(days: 31),
            icon: .airplane,
            tasks: [
                EventTask(isCompleted: true, title: "Get passport"),
                EventTask(isCompleted: true, title: "Book flights"),
            ],
            title: "Europe Trip"
        ),
        Event(
            color: .green,
            date: Date.now,
            icon: .leaf,
            tasks: [
                EventTask(title: "Find a sleeping bag"),
                EventTask(title: "Bug spray"),
                EventTask(title: "Paper towels"),
                EventTask(title: "Food for 4 meals"),
                EventTask(title: "Straw hat"),
            ],
            title: "Camping Trip"
        ),
        Event(
            color: .green,
            date: Date.now.add(days: 1),
            icon: .gamecontroller,
            tasks: [
                EventTask(title: "Find a board game to bring"),
                EventTask(title: "Bring a dessert to share"),
            ],
            title: "Game Night"
        ),
        Event(
            color: .magenta,
            date: Date.now.add(days: 8),
            icon: .books,
            tasks: [
                EventTask(title: "Finish chapters 8-15"),
                EventTask(title: "Bring a snacks to share"),
            ],
            title: "Book Club"
        ),
        Event(
            color: .darkGray,
            date: Date.now.add(days: 30),
            icon: .buildingColumns,
            tasks: [
                EventTask(title: "Notebooks"),
                EventTask(title: "Pencils"),
                EventTask(title: "Binder"),
                EventTask(title: "First day of school outfit"),
            ],
            title: "First Day of School"
        ),
        Event(
            color: .magenta,
            date: Date.now.add(days: -7),
            icon: .books,
            tasks: [
                EventTask(title: "Finish first draft"),
                EventTask(title: "Send draft to editor"),
                EventTask(title: "Final read-through"),
            ],
            title: "Book Launch"
        ),
    ]

    func add(_ event: Event) {
        events.append(event)
    }

    func sortedEvents(section: EventSection) -> Binding<[Event]> {
        Binding<[Event]>(
            get: {
                self.events
                    .filter { !$0.isDeleted }
                    .filter {
                        switch section {
                        case .today:
                            return $0.isToday
                        case .tomorrow:
                            return $0.isTomorrow
                        case .nextSevenDays:
                            return $0.isWithinSevenDays
                        case .nextThirtyDays:
                            return $0.isWithinSevenToThirtyDays
                        case .future:
                            return $0.isGreaterThanThirtyDays
                        case .past:
                            return $0.isPast
                        }
                    }
                    .sorted { $0.date < $1.date }
            },
            set: { events in
                for event in events {
                    if let index = self.events.firstIndex(where: { $0.id == event.id }) {
                        self.events[index] = event
                    }
                }
            }
        )
    }
}
