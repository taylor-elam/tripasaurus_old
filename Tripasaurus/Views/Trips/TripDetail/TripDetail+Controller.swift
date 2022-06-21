import SwiftUI

extension TripDetailView {
    var isSaveDisabled: Bool {
        return trip.title.isEmpty
    }

    func addNewFlight() {
        newFlight = FlightReservation()
        isAddingNewFlight = true
    }

    func addTrip() {
        tripStore.add(tripCopy)
        dismiss()
    }

    func cancelAddTrip() {
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
}
