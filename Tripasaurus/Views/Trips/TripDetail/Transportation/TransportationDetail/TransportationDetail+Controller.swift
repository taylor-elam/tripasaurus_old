import Foundation

extension TransportationDetailView {
    var isSaveDisabled: Bool {
        return reservationCopy.departureCity.isEmpty || reservationCopy.arrivalCity.isEmpty
    }

    func addTransportation() {
        trip.transportation.append(reservationCopy)
        dismiss()
    }

    func cancel() {
        dismiss()
    }

    func deleteTransportation() {
        reservation.isDeleted = true
        dismiss()
    }

    func saveTransportation() {
        reservation = reservationCopy
        dismiss()
    }
}
