import SwiftUI

struct TransportNode: View {
    @Binding var city: String
    @Binding var date: Date
    var cityPlaceholder: String
    var dateTitle: String
    var label: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            VStack(alignment: .leading) {
                TextField(LocalizedStringKey(cityPlaceholder), text: $city)
                    .textInputStyle(label: label)
                // TODO: date format - MMM d
                DatePicker(LocalizedStringKey(dateTitle), selection: $date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
            }
        }
    }
}

struct TransportNode_Previews: PreviewProvider {
    static var previews: some View {
        TransportNode(
            city: .constant(TransportReservation.flightExample.departureCity),
            date: .constant(Date.now),
            cityPlaceholder: TripVault.transportDepartureCityPlaceholder.name,
            dateTitle: TripVault.transportDepartureDate.name,
            label: TripVault.transportDepart.name
        )
    }
}
