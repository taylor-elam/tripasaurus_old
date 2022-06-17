import Foundation

extension EventListView {
    func addNewEvent() {
        newEvent = Event()
        isAddingNewEvent = true
    }

    func copyEvent(event: Event) {
        newEvent = event
        newEvent.title = "Copy of \(event.title)"
        isAddingNewEvent = true
    }
}
