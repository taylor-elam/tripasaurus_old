import SwiftUI

extension FlightDetailView {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d"
        return formatter
    }

    var isSaveDisabled: Bool {
        return reservationCopy.departureCity == "" || reservationCopy.arrivalCity == ""
    }

    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        return formatter
    }

    func addFlight() {
        trip.flights.append(reservationCopy)
        dismiss()
    }

    func cancel() {
        dismiss()
    }

    func deleteReservation() {
        reservation.isDeleted = true
        dismiss()
    }

    func saveFlight() {
        reservation = reservationCopy
        dismiss()
    }

    func selectDeselect(row: String) {
        withAnimation(.linear) {
            selection = (selection == row) ? "" : row
        }
    }
}
