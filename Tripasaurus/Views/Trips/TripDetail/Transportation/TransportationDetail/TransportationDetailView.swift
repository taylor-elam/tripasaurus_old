import SwiftUI

struct TransportationDetailView: View {
    @Binding var reservation: TransportationReservation
    @Binding var trip: Trip

    @Environment(\.dismiss) var dismiss
    @State var isMainDetailsSelected: Bool = false
    @State var isNew = false
    @State var reservationCopy = TransportationReservation()
    let decimalFormatter: NumberFormatter = NumberFormatter().decimal()

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    TransportationNode(
                        city: $reservationCopy.departureCity,
                        date: $reservationCopy.departureDate,
                        cityPlaceholder: TripVault.transportationDepartureCityPlaceholder.name,
                        dateTitle: TripVault.transportationDepartureDate.name,
                        label: TripVault.transportationDepart.name
                    )

                    TransportationNode(
                        city: $reservationCopy.arrivalCity,
                        date: $reservationCopy.arrivalDate,
                        cityPlaceholder: TripVault.transportationArrivalCityPlaceholder.name,
                        dateTitle: TripVault.transportationArrivalDate.name,
                        label: TripVault.transportationArrive.name
                    )

                    Divider()

                    HStack {
                        TextField(
                            LocalizedStringKey(TripVault.transportationCarrier.name),
                            text: $reservationCopy.carrier
                        )
                        .textInputStyle(label: TripVault.transportationCarrier.name)

                        TextField(
                            LocalizedStringKey(TripVault.transportationRouteNumber.name),
                            text: $reservationCopy.routeNumber
                        )
                        .textInputStyle(label: TripVault.transportationRouteNumber.name)
                    }

                    Divider()

                    HStack {
                        TextField(
                            LocalizedStringKey(TripVault.transportationConfirmationNumber.name),
                            text: $reservationCopy.confirmationNumber
                        )
                        .textInputStyle(label: TripVault.transportationConfirmationNumber.name)

                        TextField(
                            LocalizedStringKey(TripVault.transportationCost.name),
                            value: $reservationCopy.cost, formatter: decimalFormatter
                        )
                        .textInputStyle(label: TripVault.transportationCost.name)
                        .keyboardType(.decimalPad)
                        // TODO: add custom currency input
                    }

                    TextEditor(text: $reservationCopy.notes)
                        .frame(height: 120)
                        .padding(.vertical, -5)
                        .textInputStyle(label: TripVault.transportationNotes.name)
                }
                .padding()
                .listCardStyle()
                .padding(.horizontal)
            }

            DeleteButton(action: deleteTransportation, label: TripVault.transportationDelete.name).deleteButtonStyle()
        }
        .background(Color(UIColor.secondarySystemBackground))
        .onAppear {
            reservationCopy = reservation
            isMainDetailsSelected = isNew
        }
        .navigationBarTitle(
            Text(LocalizedStringKey(
                isNew ? TripVault.transportationNew.name : TripVault.transportationReservation.name
            )),
            displayMode: .inline
        )
        .toolbar {
            SaveToolbar(isNew: isNew, isSaveDisabled: isSaveDisabled, showCancelButton: isNew, addAction: addTransportation, cancelAction: cancel, saveAction: saveTransportation)
        }
    }
}

struct TransportationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransportationDetailView(reservation: .constant(TransportationReservation.example), trip: .constant(Trip.example))
        }
        .previewLayout(.sizeThatFits)
    }
}
