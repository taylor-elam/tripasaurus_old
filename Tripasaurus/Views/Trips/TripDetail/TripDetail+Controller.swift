import SwiftUI

extension TripDetailView {
    var isSaveDisabled: Bool {
        return trip.title.isEmpty
    }

    func addNewTransport(isFlight: Bool) {
        newTransportation = TransportReservation()
        newTransportation.mode = isFlight ? .flight : .default
        isAddingNewReservation = true
        newReservationType = isFlight ? "flight" : "transportation"
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
