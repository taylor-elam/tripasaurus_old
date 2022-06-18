import Foundation

extension TripListView {
    func addNewTrip() {
        newTrip = Trip()
        isAddingNewTrip = true
    }
    
    func copyTrip(trip: Trip) {
        newTrip = trip
        newTrip.title = "Copy of \(trip.title)"
        isAddingNewTrip = true
    }
}
