import SwiftUI

extension FlightDetailView {
    var isSaveDisabled: Bool {
        return reservationCopy.departureCity.isEmpty || reservationCopy.arrivalCity.isEmpty
    }

    func addFlight() {
        trip.flights.append(reservationCopy)
        dismiss()
    }

    func cancel() {
        dismiss()
    }

    func deleteFlight() {
        reservation.isDeleted = true
        dismiss()
    }

    func saveFlight() {
        reservation = reservationCopy
        dismiss()
    }
}
