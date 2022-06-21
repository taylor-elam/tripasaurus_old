import SwiftUI

struct TripListView: View {
    @EnvironmentObject var tripStore: TripStore
    @State var isAddingNewTrip: Bool = false
    @State var newTrip: Trip = Trip()

    var body: some View {
        List {
            // TODO: add sections by time period
            ForEach(tripStore.sortedTrips()) { $trip in
                NavigationLink(
                    destination: { TripDetailView(trip: $trip) },
                    label: { TripRow(trip: $trip) }
                )
                .swipeActions(edge: .leading) { CopyButton(action: { copy(trip: trip) }) }
                .swipeActions { DeleteButton(action: { trip.isDeleted = true }) }
            }
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem {
                Button(
                    action: addNewTrip,
                    label: { Label(LocalizedStringKey(TripVault.add.name), systemImage: AppSymbol.addNew.name) }
                )
            }
        }
        .sheet(isPresented: $isAddingNewTrip) {
            NavigationView {
                TripDetailView(trip: $newTrip, isNew: true)
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
