import SwiftUI

extension TripDetailView {
    var isSaveDisabled: Bool {
        return trip.title.isEmpty
    }
    
    func addNewFlight() {
        newFlight = FlightReservation()
        isAddingNewReservation = true
        newReservationType = "flight"
    }
    
    func addNewTransportation() {
        newTransportation = TransportationReservation()
        isAddingNewReservation = true
        newReservationType = "transportation"
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
