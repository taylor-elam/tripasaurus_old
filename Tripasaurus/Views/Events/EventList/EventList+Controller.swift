import Foundation

extension EventListView {
    func addNewEvent() {
        newEvent = Event()
        isAddingNewEvent = true
    }

    func copy(event: Event) {
        newEvent = event
        newEvent.title = "Copy of \(event.title)"
        isAddingNewEvent = true
    }
}
