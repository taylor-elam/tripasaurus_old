import SwiftUI

struct TransportRow: View {
    @Binding var reservation: TransportReservation
    let dateFormatter: DateFormatter = DateFormatter().with(format: "E, MMM d")

    var overnightDays: Int {
        return Calendar.current.dateComponents([.day], from: reservation.departureDate.startOfDay, to: reservation.arrivalDate.startOfDay).day ?? 0
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(reservation.departureCity)
                if !(reservation.departureCity.isEmpty && reservation.arrivalCity.isEmpty) {
                    Image(systemName: AppSymbol.arrowRight.name).foregroundColor(.gray)
                }
                Text(reservation.arrivalCity)
            }
            .font(.headline)

            HStack(spacing: 5) {
                Text("\(reservation.departureDate, formatter: dateFormatter)")
                Text("•")
                Text(reservation.departureDate.formatted(date: .omitted, time: .shortened))
                Text("—")
                Text(reservation.arrivalDate.formatted(date: .omitted, time: .shortened))
                Text(overnightDays > 0 ? "+\(overnightDays)" : "")
                    .font(.footnote)
                    .baselineOffset(6.0)
            }

            HStack {
                Text(reservation.carrier)
                Text(reservation.routeNumber)
            }
            .font(.caption2)
        }
    }
}

struct Transport_Previews: PreviewProvider {
    static var previews: some View {
        TransportRow(reservation: .constant(TransportReservation.transportExample))
            .previewLayout(.sizeThatFits)
    }
}
