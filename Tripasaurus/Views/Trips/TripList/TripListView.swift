import SwiftUI

struct TripListView: View {
    @EnvironmentObject var tripStore: TripStore

    var body: some View {
        List {
            // TODO: add Add Trip button
            // TODO: add sections by time period
            ForEach(tripStore.sortedTrips()) { $trip in
                NavigationLink {
                    TripDetailView(trip: $trip)
                } label: {
                    TripRow(trip: $trip)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        trip.isDeleted = true
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
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
