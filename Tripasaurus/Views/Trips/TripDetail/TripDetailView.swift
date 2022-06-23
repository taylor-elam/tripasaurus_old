import SwiftUI

struct TripDetailView: View {
    @Binding var trip: Trip

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var tripStore: TripStore
    @State var isAddingNewFlight: Bool = false
    @State var isNew: Bool = false
    @State var newFlight: FlightReservation = FlightReservation()
    @State var tripCopy: Trip = Trip()

    var body: some View {
        VStack {
            TripMainDetails(trip: $tripCopy)

            List {
                FlightsSection(trip: $trip, addNewFlight: addNewFlight)
                // TODO: add Transportation
                // TODO: add Hotels & Lodging
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
        .sheet(isPresented: $isAddingNewFlight) {
            NavigationView {
                FlightDetailView(reservation: $newFlight, trip: $trip, isNew: true)
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
