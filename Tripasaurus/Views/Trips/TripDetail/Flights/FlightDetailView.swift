import SwiftUI

struct FlightDetailView: View {
    @Binding var reservation: FlightReservation
    @Binding var trip: Trip

    @Environment(\.dismiss) var dismiss
    @State var isNew = false
    @State var reservationCopy = FlightReservation()
    @State var selection: String = ""

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                if !isNew {
                    FlightMainDetails(reservation: $reservation, dateFormatter: dateFormatter)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onTapGesture { selectDeselect(row: "flightMainDetails") }
                }

                if selection == "flightMainDetails" {
                    if !isNew { Divider() }

                    TransportationNode(
                        city: $reservationCopy.departureCity,
                        date: $reservationCopy.departureDate,
                        cityPlaceholder: "Origin",
                        dateTitle: "Departure Date",
                        label: "Depart"
                    )

                    TransportationNode(
                        city: $reservationCopy.arrivalCity,
                        date: $reservationCopy.arrivalDate,
                        cityPlaceholder: "Destination",
                        dateTitle: "Arrival Date",
                        label: "Arrive"
                    )
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Carrier").font(.caption).foregroundColor(.secondary)
                        TextField("Carrier", text: $reservationCopy.carrier)
                            .textInputStyle()
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Flight #").font(.caption).foregroundColor(.secondary)
                        TextField("Flight #", text: $reservationCopy.flightNumber)
                            .textInputStyle()
                    }

                    Divider()
                }

                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Confirmation #").font(.caption).foregroundColor(.secondary)
                        TextField("Confirmation #", text: $reservationCopy.confirmationNumber)
                            .textInputStyle()
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Cost").font(.caption).foregroundColor(.secondary)
                        TextField("Cost", value: $reservationCopy.cost, formatter: numberFormatter)
                            .textInputStyle()
                            .keyboardType(.decimalPad)
                        // TODO: add custom currency input
                    }
                }

                VStack(alignment: .leading, spacing: 5) {
                    // TODO: add custom label style
                    Text("Notes").font(.caption).foregroundColor(.secondary)
                    TextEditor(text: $reservationCopy.notes)
                        .frame(height: 120)
                        .padding(.vertical, -5)
                        .textInputStyle()
                }
            }
            .padding()
            .listCardStyle()
            .padding(.horizontal)

            Spacer()
            
            Button(role: .destructive, action: deleteReservation, label: { Label("Delete Reservation", systemImage: "trash") })
                .deleteButtonStyle()
        }
        .background(Color(UIColor.secondarySystemBackground))
        .onAppear {
            reservationCopy = reservation
            selection = isNew ? "flightMainDetails" : ""
        }
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                if isNew { Button(action: cancel, label: { Text("Cancel") }) }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(
                    action: isNew ? addFlight : saveFlight,
                    label: { Text(isNew ? "Add" : "Save").disabled(isSaveDisabled) }
                )
            }
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
