import SwiftUI

struct FlightsSection: View {
    @Binding var trip: Trip
    var addNewFlight: () -> Void

    var body: some View {
        Section(content: {
            ForEach($trip.flights.filter { !$0.isDeleted.wrappedValue }) { $flight in
                NavigationLink(
                    destination: { FlightDetailView(reservation: $flight, trip: $trip) },
                    label: { FlightRow(reservation: $flight) }
                )
                .swipeActions { DeleteButton(action: { flight.isDeleted = true }) }
            }
            Button(
                action: addNewFlight,
                label: {
                    Label(LocalizedStringKey(TripVault.flightAdd.name), systemImage: AppSymbol.addNew.name)
                }
            )
            .padding(.horizontal, -4)
        }, header: {
            Label(
                LocalizedStringKey(TripVault.flightSectionHeader.name),
                systemImage: AppSymbol.airplane.name
            ).font(.title2).fontWeight(.bold)
        })
    }
}

struct FlightsSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            FlightsSection(trip: .constant(Trip.example), addNewFlight: {})
        }.listStyle(.sidebar)
    }
}
