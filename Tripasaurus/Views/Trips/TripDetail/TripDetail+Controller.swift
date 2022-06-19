import SwiftUI

extension TripDetailView {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d"
        return formatter
    }

    func addTrip(trip: Trip) {
        tripStore.add(trip)
        dismiss()
    }

    func deleteTrip() {
        trip.isDeleted = true
        dismiss()
    }

    func getOvernightDays(_ departureDate: Date, _ arrivalDate: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: departureDate.startOfDay, to: arrivalDate.startOfDay).day ?? 0
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
