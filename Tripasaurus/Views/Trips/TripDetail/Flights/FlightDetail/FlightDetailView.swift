import SwiftUI

struct FlightDetailView: View {
    @Binding var reservation: FlightReservation
    @Binding var trip: Trip

    @Environment(\.dismiss) var dismiss
    @State var isMainDetailsSelected: Bool = false
    @State var isNew = false
    @State var reservationCopy = FlightReservation()
    let decimalFormatter: NumberFormatter = NumberFormatter().decimal()

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
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
                    
                    Divider()
                    
                    HStack {
                        TextField(
                            LocalizedStringKey(TripVault.flightCarrier.name),
                            text: $reservationCopy.carrier
                        )
                        .textInputStyle(label: TripVault.flightCarrier.name)
                        
                        TextField(
                            LocalizedStringKey(TripVault.flightNumber.name),
                            text: $reservationCopy.flightNumber
                        )
                        .textInputStyle(label: TripVault.flightNumber.name)
                    }

                    Divider()

                    HStack {
                        TextField(
                            LocalizedStringKey(TripVault.flightConfirmationNumber.name),
                            text: $reservationCopy.confirmationNumber
                        )
                        .textInputStyle(label: TripVault.flightConfirmationNumber.name)

                        TextField(
                            LocalizedStringKey(TripVault.flightCost.name),
                            value: $reservationCopy.cost, formatter: decimalFormatter
                        )
                        .textInputStyle(label: TripVault.flightCost.name)
                        .keyboardType(.decimalPad)
                        // TODO: add custom currency input
                    }

                    TextEditor(text: $reservationCopy.notes)
                        .frame(height: 120)
                        .padding(.vertical, -5)
                        .textInputStyle(label: TripVault.flightNotes.name)
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
            SaveToolbar(isNew: isNew, isSaveDisabled: isSaveDisabled, showCancelButton: isNew, addAction: addFlight, cancelAction: cancel, saveAction: saveFlight)
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
