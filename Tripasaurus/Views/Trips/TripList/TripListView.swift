import SwiftUI

struct TripListView: View {
    @EnvironmentObject var tripStore: TripStore

    var body: some View {
        List {
            // TODO: add Add Trip button
            // TODO: add sections by time period
            ForEach(tripStore.sortedTrips()) { $trip in
                TripRow(trip: $trip)
                // TODO: add swipe to delete
            }
        }
    }
}

struct TripListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TripListView().environmentObject(TripStore())
        }
    }
}
