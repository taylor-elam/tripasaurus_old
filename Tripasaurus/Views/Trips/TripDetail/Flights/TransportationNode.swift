import SwiftUI

struct TransportationNode: View {
    @Binding var city: String
    @Binding var date: Date
    var cityPlaceholder: String
    var dateTitle: String
    var label: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(LocalizedStringKey(label)).font(.caption).foregroundColor(.secondary)
            VStack(alignment: .leading) {
                TextField(LocalizedStringKey(cityPlaceholder), text: $city)
                    .textInputStyle()
                // TODO: date format - MMM d
                DatePicker(LocalizedStringKey(dateTitle), selection: $date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
            }
        }
    }
}

struct TransportationNode_Previews: PreviewProvider {
    static var previews: some View {
        TransportationNode(
            city: .constant(FlightReservation.example.departureCity),
            date: .constant(Date.now),
            cityPlaceholder: TripVault.flightDepartureCityPlaceholder.name,
            dateTitle: TripVault.flightDepartureDate.name,
            label: TripVault.flightDepart.name
        )
    }
}
