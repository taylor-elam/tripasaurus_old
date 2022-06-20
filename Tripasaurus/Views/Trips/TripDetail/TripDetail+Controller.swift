import SwiftUI

extension TripDetailView {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d"
        return formatter
    }

    func addFlight() {
        newFlight = FlightReservation()
        isAddingNewFlight = true
    }

    func add(trip: Trip) {
        tripStore.add(trip)
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
