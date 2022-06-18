import SwiftUI

extension TripDetailView {
    func addTrip(trip: Trip) {
        tripStore.add(trip)
        dismiss()
    }

    func deleteTrip() {
        trip.isDeleted = true
        dismiss()
    }

    func saveTrip() {
        trip = tripCopy
        dismiss()
    }

    func selectDeselect(row: String) {
        withAnimation(.linear) {
            selection = (selection == row) ? "" : row
        }
    }
}
