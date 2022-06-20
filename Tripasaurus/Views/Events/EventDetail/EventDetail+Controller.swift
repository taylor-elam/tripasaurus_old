import SwiftUI

extension EventDetailView {
    func addEvent(event: Event) {
        eventStore.add(event)
        dismiss()
    }

    func cancelEventEdit() {
        dismiss()
    }

    func deleteEvent() {
        event.isDeleted = true
        dismiss()
    }

    func saveEvent() {
        event = eventCopy
        dismiss()
    }

    func selectDeselect(row: String) {
        withAnimation(.linear) {
            selection = (selection == row) ? "" : row
        }
    }
}
