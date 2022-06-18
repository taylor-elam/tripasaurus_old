import SwiftUI

class TripStore: ObservableObject {
    @Published var trips: [Trip] = [
        Trip.example,
        Trip(endDate: Date.now.add(days: 150), startDate: Date.now.add(days: 140), title: "Trip to NYC")
    ]

    func sortedTrips() -> Binding<[Trip]> {
        Binding<[Trip]>(
            get: {
                self.trips
                    .filter { !$0.isDeleted }
                    .sorted { $0.startDate < $1.startDate }
            },
            set: { trips in
                for trip in trips {
                    if let index = self.trips.firstIndex(where: { $0.id == trip.id }) {
                        self.trips[index] = trip
                    }
                }
            }
        )
    }
}
