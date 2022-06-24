import SwiftUI

struct TransportationSection: View {
    @Binding var trip: Trip

    var body: some View {
        Section(content: {
            ForEach($trip.transportation.filter { !$0.isDeleted.wrappedValue }) { $reservation in
                NavigationLink(
                    destination: TransportationDetailView(reservation: $reservation, trip: $trip),
                    label: { TransportationRow(reservation: $reservation) }
                )
                .swipeActions { DeleteButton(action: { reservation.isDeleted = true }) }
            }
        }, header: {
            Label(
                LocalizedStringKey(TripVault.transportationSectionHeader.name),
                systemImage: AppSymbol.transportation.name
            ).font(.title2).fontWeight(.bold)
        })
    }
}

struct TransportationSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TransportationSection(trip: .constant(Trip.example))
        }.listStyle(.sidebar)
    }
}
