import SwiftUI

struct FlightDetailView: View {
    @Binding var reservation: FlightReservation
    @Binding var trip: Trip

    @Environment(\.dismiss) var dismiss
    @State var isMainDetailsSelected: Bool = false
    @State var isNew = false
    @State var reservationCopy = FlightReservation()
    let currencyFormatter: NumberFormatter = NumberFormatter().currency()

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    if !isNew {
                        FlightMainDetails(reservation: $reservation)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .onTapGesture { isMainDetailsSelected.toggle() }
                    }

                    if isMainDetailsSelected {
                        if !isNew { Divider() }

                        TransportationNode(
                            city: $reservationCopy.departureCity,
                            date: $reservationCopy.departureDate,
                            cityPlaceholder: TripVault.flightDepartureCityPlaceholder.name,
                            dateTitle: TripVault.flightDepartureDate.name,
                            label: TripVault.flightDepart.name
                        )

                        TransportationNode(
                            city: $reservationCopy.arrivalCity,
                            date: $reservationCopy.arrivalDate,
                            cityPlaceholder: TripVault.flightArrivalCityPlaceholder.name,
                            dateTitle: TripVault.flightArrivalDate.name,
                            label: TripVault.flightArrive.name
                        )
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(LocalizedStringKey(TripVault.flightCarrier.name))
                                .font(.caption).foregroundColor(.secondary)
                            TextField(
                                LocalizedStringKey(TripVault.flightCarrier.name),
                                text: $reservationCopy.carrier
                            )
                            .textInputStyle()
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(LocalizedStringKey(TripVault.flightNumber.name))
                                .font(.caption).foregroundColor(.secondary)
                            TextField(
                                LocalizedStringKey(TripVault.flightNumber.name),
                                text: $reservationCopy.flightNumber
                            )
                            .textInputStyle()
                        }

                        Divider()
                    }

                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(LocalizedStringKey(TripVault.flightConfirmationNumber.name))
                                .font(.caption).foregroundColor(.secondary)
                            TextField(
                                LocalizedStringKey(TripVault.flightConfirmationNumber.name),
                                text: $reservationCopy.confirmationNumber
                            )
                            .textInputStyle()
                        }

                        VStack(alignment: .leading, spacing: 5) {
                            Text(LocalizedStringKey(TripVault.flightCost.name))
                                .font(.caption).foregroundColor(.secondary)
                            TextField(
                                LocalizedStringKey(TripVault.flightCost.name),
                                value: $reservationCopy.cost, formatter: currencyFormatter
                            )
                            .textInputStyle()
                            .keyboardType(.decimalPad)
                            // TODO: add custom currency input
                        }
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        // TODO: add custom label style
                        Text(LocalizedStringKey(TripVault.flightNotes.name))
                            .font(.caption).foregroundColor(.secondary)
                        TextEditor(text: $reservationCopy.notes)
                            .frame(height: 120)
                            .padding(.vertical, -5)
                            .textInputStyle()
                    }
                }
                .padding()
                .listCardStyle()
                .padding(.horizontal)
            }

            DeleteButton(action: deleteFlight, label: TripVault.flightDelete.name).deleteButtonStyle()
        }
        .background(Color(UIColor.secondarySystemBackground))
        .onAppear {
            reservationCopy = reservation
            isMainDetailsSelected = isNew
        }
        .navigationBarTitle(
            Text(LocalizedStringKey(isNew ? TripVault.flightNew.name : TripVault.flightReservation.name)),
            displayMode: .inline
        )
        .toolbar {
            SaveToolbar(isNew: isNew, isSaveDisabled: isSaveDisabled, addAction: addFlight, cancelAction: cancel, saveAction: saveFlight)
        }
    }
}

struct FlightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FlightDetailView(reservation: .constant(FlightReservation.example), trip: .constant(Trip.example))
                .previewLayout(.sizeThatFits)
        }
    }
}
