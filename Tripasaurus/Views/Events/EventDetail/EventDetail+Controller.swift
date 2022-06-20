import SwiftUI

extension EventDetailView {
    func add(event: Event) {
        eventStore.add(event)
        dismiss()
    }

    func cancel() {
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
