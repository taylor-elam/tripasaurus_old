import Foundation

extension TransportDetailView {
    var isSaveDisabled: Bool {
        return reservationCopy.departureCity.isEmpty || reservationCopy.arrivalCity.isEmpty
    }

    func addTransport() {
        trip.transportation.append(reservationCopy)
        dismiss()
    }

    func cancel() {
        dismiss()
    }

    func deleteTransport() {
        reservation.isDeleted = true
        dismiss()
    }

    func saveTransport() {
        reservation = reservationCopy
        dismiss()
    }
}
