import SwiftUI

struct FlightDetailView: View {
    @Binding var reservation: FlightReservation
    @State var selection: String = ""

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                FlightMainDetails(reservation: $reservation, dateFormatter: dateFormatter)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture { selectDeselect(row: "flightMainDetails") }

                if selection == "flightMainDetails" {
                    TextField("Departure City", text: $reservation.departureCity)
                    TextField("Arrival City", text: $reservation.arrivalCity)
                }

                Divider()

                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Confirmation #").font(.caption).foregroundColor(.secondary)
                        TextField("Confirmation #", text: $reservation.confirmationNumber)
                            .textInputStyle()
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Cost").font(.caption).foregroundColor(.secondary)
                        TextField("Cost", value: $reservation.cost, formatter: numberFormatter)
                            .textInputStyle()
                            .keyboardType(.decimalPad)
                        // TODO: add custom currency input
                    }
                }
                
                Divider()

                VStack(alignment: .leading, spacing: 5) {
                    // TODO: add custom label style
                    Text("Notes").font(.caption).foregroundColor(.secondary)
                    TextEditor(text: $reservation.notes)
                        .frame(height: 120)
                        .padding(.vertical, -5)
                        .textInputStyle()
                }
            }
            .padding()
            .listCardStyle()
            .padding(.horizontal)

            Spacer()
        }
        .background(Color(UIColor.secondarySystemBackground))
    }
}

struct FlightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FlightDetailView(reservation: .constant(FlightReservation.example))
                .previewLayout(.sizeThatFits)
        }
    }
}
