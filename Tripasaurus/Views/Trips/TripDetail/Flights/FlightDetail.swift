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

                if !reservation.confirmationNumber.isEmpty || reservation.cost > 0 || !reservation.notes.isEmpty {
                    Divider()
                }

                HStack {
                    if !reservation.confirmationNumber.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Confirmation #").font(.caption).foregroundColor(.secondary)
                            Text(reservation.confirmationNumber)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    if reservation.cost > 0 {
                        VStack(alignment: .leading) {
                            Text("Cost").font(.caption).foregroundColor(.secondary)
                            Text(numberFormatter.string(from: reservation.cost as NSNumber) ?? "")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }

                if !reservation.notes.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Notes").font(.caption).foregroundColor(.secondary)
                        Text(reservation.notes)
                        // TODO: Add More/Less button and truncate notes
                    }
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
