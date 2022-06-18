import SwiftUI

struct TripListView: View {
    @EnvironmentObject var tripStore: TripStore
    @State var isAddingNewTrip = false
    @State var newTrip = Trip()

    var body: some View {
        List {
            // TODO: add sections by time period
            ForEach(tripStore.sortedTrips()) { $trip in
                NavigationLink {
                    TripDetailView(trip: $trip)
                } label: {
                    TripRow(trip: $trip)
                }
                .swipeActions(edge: .leading) {
                    Button {
                        copyTrip(trip: trip)
                    } label: {
                        Label("Copy", systemImage: "doc.on.doc")
                    }
                    .tint(.purple)
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
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem {
                Button { addNewTrip() } label: { Label("Add Trip", systemImage: "plus") }
            }
        }
        .sheet(isPresented: $isAddingNewTrip) {
            NavigationView {
                TripDetailView(trip: $newTrip, isNew: true)
                    .navigationBarTitle(Text("New Trip"), displayMode: .inline)
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
