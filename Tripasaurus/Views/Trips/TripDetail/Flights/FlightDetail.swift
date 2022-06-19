import SwiftUI

struct FlightDetail: View {
    @Binding var reservation: FlightReservation

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d"
        return formatter
    }

    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        return formatter
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                FlightMainDetails(reservation: $reservation, dateFormatter: dateFormatter)
                    .frame(maxWidth: .infinity, alignment: .leading)

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

struct FlightDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FlightDetail(reservation: .constant(FlightReservation.example))
                .previewLayout(.sizeThatFits)
        }
    }
}
