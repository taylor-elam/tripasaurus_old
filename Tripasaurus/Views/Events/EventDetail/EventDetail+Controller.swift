import SwiftUI

extension EventDetailView {
    func addEvent(event: Event) {
        eventStore.add(event)
        dismiss()
    }

    func saveEvent() {
        event = eventCopy
        dismiss()
    }

    func selectDeselect(row: String) {
        withAnimation(.linear) {
            if selection == row {
                selection = ""
            } else {
                selection = row
            }
        }
    }
}
