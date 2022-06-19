import SwiftUI

struct TripDetailView: View {
    @Binding var trip: Trip

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var tripStore: TripStore
    @State var isNew = false
    @State var tripCopy: Trip = Trip()

    var body: some View {
        VStack {
            TripMainDetails(trip: $tripCopy)

            List {
                Section(content: {
                    ForEach($trip.flights) { $flight in
                        FlightMainDetails(
                            reservation: $flight,
                            dateFormatter: dateFormatter,
                            overnightDays: getOvernightDays(flight.departureDate, flight.arrivalDate)
                        )
                    }
                }, header: { Label("Flights", systemImage: "airplane").font(.title2).fontWeight(.bold) })
                // TODO: add Hotels & Lodging
                // TODO: add Budgeting
            }

            Spacer()

            Button(role: .destructive, action: deleteTrip, label: { Label("Delete Trip", systemImage: "trash") })
        }
        .onAppear { tripCopy = trip }
        .background(Color(UIColor.secondarySystemBackground))
        .navigationBarTitle("", displayMode: .inline)
        // TODO: add styling to navbar
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                if isNew { Button("Cancel") { dismiss() } }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(isNew ? "Add" : "Save") { isNew ? addTrip(trip: tripCopy) : saveTrip() }
                    .disabled(tripCopy.title.isEmpty)
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
