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
                Section(content: {
                    ForEach($trip.flights.filter { !$0.isDeleted.wrappedValue }) { $flight in
                        NavigationLink(
                            destination: { FlightDetailView(reservation: $flight, trip: $trip) },
                            label: { FlightMainDetails(reservation: $flight, dateFormatter: dateFormatter) }
                        )
                        .swipeActions { DeleteButton(action: { flight.isDeleted = true }) }
                    }
                    Button(
                        action: addNewFlight,
                        label: { Label("Add Task", systemImage: "plus") }
                    )
                    .padding(.horizontal, -4)
                }, header: { Label("Flights", systemImage: "airplane").font(.title2).fontWeight(.bold) })
                // TODO: add Hotels & Lodging
                // TODO: add Budgeting
            }
            .listStyle(.sidebar)

            Spacer()

            DeleteButton(action: deleteTrip, label: "Delete Trip").deleteButtonStyle()
        }
        .onAppear { tripCopy = trip }
        .background(Color(UIColor.secondarySystemBackground))
        .navigationBarTitle("", displayMode: .inline)
        // TODO: add styling to navbar
        .toolbar {
            SaveToolbar(isNew: isNew, isSaveDisabled: isSaveDisabled, addAction: addTrip, cancelAction: cancelAddTrip, saveAction: saveTrip)
        }
        .sheet(isPresented: $isAddingNewFlight) {
            NavigationView {
                FlightDetailView(reservation: $newFlight, trip: $trip, isNew: true)
                    .navigationBarTitle(Text("New Flight Reservation"), displayMode: .inline)
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
