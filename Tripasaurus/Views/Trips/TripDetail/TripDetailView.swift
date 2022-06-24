import SwiftUI

struct TripDetailView: View {
    @Binding var trip: Trip

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var tripStore: TripStore
    @State var isAddingNewReservation: Bool = false
    @State var isNew: Bool = false
    @State var newReservationType: String = ""
    @State var newFlight: TransportReservation = TransportReservation()
    @State var newTransportation: TransportReservation = TransportReservation()
    @State var tripCopy: Trip = Trip()

    var body: some View {
        VStack {
            TripMainDetails(trip: $tripCopy)

            List {
                TransportSection(trip: $trip, isFlight: true, addNewTransport: addNewFlight)
                TransportSection(trip: $trip, isFlight: false, addNewTransport: addNewTransport)
                // TODO: add Hotels & Lodging
                // TODO: add Points of Interest
                BudgetingSection(trip: $trip)
            }
            .listStyle(.sidebar)

            Spacer()

            DeleteButton(action: deleteTrip, label: TripVault.delete.name).deleteButtonStyle()
        }
        .onAppear { tripCopy = trip }
        .background(Color(UIColor.secondarySystemBackground))
        // TODO: add styling to navbar
        .navigationBarTitle(Text(isNew ? LocalizedStringKey(TripVault.new.name) : ""), displayMode: .inline)
        .toolbar {
            SaveToolbar(isNew: isNew, isSaveDisabled: isSaveDisabled, showCancelButton: isNew, addAction: addTrip, cancelAction: cancelAddTrip, saveAction: saveTrip)
        }
        .sheet(isPresented: $isAddingNewReservation) {
            NavigationView {
                TransportDetailView(
                    reservation: $newFlight,
                    trip: $trip,
                    isFlight: newReservationType == "flight",
                    isNew: true
                )
            }
        }
    }
}

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TripDetailView(trip: .constant(Trip.example)).environmentObject(TripStore())
        }
    }
}
