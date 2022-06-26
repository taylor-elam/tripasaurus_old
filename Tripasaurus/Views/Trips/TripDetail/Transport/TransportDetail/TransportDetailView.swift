import SwiftUI

struct TransportDetailView: View {
    @Binding var reservation: TransportReservation
    @Binding var trip: Trip

    @Environment(\.dismiss) var dismiss
    @State var isMainDetailsSelected: Bool = false
    @State var reservationCopy: TransportReservation = TransportReservation()
    var isFlight: Bool
    var isNew: Bool
    let decimalFormatter: NumberFormatter = NumberFormatter().decimal()

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    if !isFlight {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(LocalizedStringKey(TripVault.transportationMode.name))
                                .font(.caption)
                                .foregroundColor(.secondary)
                            TransportationModePicker(reservation: $reservationCopy)
                        }
                    }

                    TransportNode(
                        city: $reservationCopy.departureCity,
                        date: $reservationCopy.departureDate,
                        cityPlaceholder: TripVault.transportDepartureCityPlaceholder.name,
                        dateTitle: TripVault.transportDepartureDate.name,
                        label: TripVault.transportDepart.name
                    )

                    TransportNode(
                        city: $reservationCopy.arrivalCity,
                        date: $reservationCopy.arrivalDate,
                        cityPlaceholder: TripVault.transportArrivalCityPlaceholder.name,
                        dateTitle: TripVault.transportArrivalDate.name,
                        label: TripVault.transportArrive.name
                    )

                    Divider()

                    HStack {
                        TextField(
                            LocalizedStringKey(TripVault.transportCarrier.name),
                            text: $reservationCopy.carrier
                        )
                        .textInputStyle(label: TripVault.transportCarrier.name)

                        TextField(
                            LocalizedStringKey(isFlight ? TripVault.flightNumber.name : TripVault.transportationRouteNumber.name),
                            text: $reservationCopy.routeNumber
                        )
                        .textInputStyle(label: isFlight ? TripVault.flightNumber.name :TripVault.transportationRouteNumber.name)
                    }

                    Divider()

                    HStack {
                        TextField(
                            LocalizedStringKey(TripVault.transportConfirmationNumber.name),
                            text: $reservationCopy.confirmationNumber
                        )
                        .textInputStyle(label: TripVault.transportConfirmationNumber.name)

                        TextField(
                            LocalizedStringKey(TripVault.transportCost.name),
                            value: $reservationCopy.cost, formatter: decimalFormatter
                        )
                        .textInputStyle(label: TripVault.transportCost.name)
                        .keyboardType(.decimalPad)
                        // TODO: add custom currency input
                    }

                    TextEditor(text: $reservationCopy.notes)
                        .frame(height: 120)
                        .padding(.vertical, -5)
                        .textInputStyle(label: TripVault.transportNotes.name)
                }
                .padding()
                .listCardStyle()
                .padding(.horizontal)
            }

            DeleteButton(action: deleteTransport, label: TripVault.transportDelete.name).deleteButtonStyle()
        }
        .background(Color(UIColor.secondarySystemBackground))
        .onAppear {
            reservationCopy = reservation
            isMainDetailsSelected = isNew
        }
        .navigationBarTitle(
            Text(LocalizedStringKey(
                isFlight
                ? isNew ? TripVault.transportNew.name : TripVault.flightHeader.name
                : isNew ? TripVault.transportNew.name : TripVault.transportationHeader.name
            )),
            displayMode: .inline
        )
        .toolbar {
            SaveToolbar(isNew: isNew, isSaveDisabled: isSaveDisabled, showCancelButton: isNew, addAction: addTransport, cancelAction: cancel, saveAction: saveTransport)
        }
    }
}

struct TransportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransportDetailView(
                reservation: .constant(TransportReservation.transportExample),
                trip: .constant(Trip.example),
                isFlight: false,
                isNew: false
            )
        }
        .previewLayout(.sizeThatFits)
    }
}
