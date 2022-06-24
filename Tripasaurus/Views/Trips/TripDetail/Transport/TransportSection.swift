import SwiftUI

struct TransportSection: View {
    @Binding var trip: Trip
    var isFlight: Bool
    var addNewTransport: () -> Void

    var body: some View {
        Section(content: {
            ForEach($trip.transportation
                .filter { !$0.isDeleted.wrappedValue && ($0.mode.wrappedValue == .flight) == isFlight }
                .sorted { $0.departureDate.wrappedValue < $1.departureDate.wrappedValue }
            ) { $reservation in
                NavigationLink(
                    destination: TransportDetailView(
                        reservation: $reservation,
                        trip: $trip,
                        isFlight: isFlight,
                        isNew: false
                    ),
                    label: { TransportRow(reservation: $reservation) }
                )
                .swipeActions { DeleteButton(action: { reservation.isDeleted = true }) }
            }
            Button(
                action: addNewTransport,
                label: {
                    Label(
                        LocalizedStringKey(TripVault.transportAdd.name),
                        systemImage: AppSymbol.addNew.name
                    )
                }
            )
            .padding(.horizontal, -4)
        }, header: {
            Label(
                LocalizedStringKey(isFlight ? TripVault.flightSectionHeader.name : TripVault.transportationSectionHeader.name),
                systemImage: isFlight ? AppSymbol.flight.name : AppSymbol.transportation.name
                // TODO: constant symbol height
            ).font(.title2).fontWeight(.bold)
        })
    }
}

struct TransportSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TransportSection(
                trip: .constant(Trip.example),
                isFlight: true,
                addNewTransport: {}
            )
        }.listStyle(.sidebar)
    }
}
