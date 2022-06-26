import SwiftUI

struct TransportNode: View {
    @Binding var city: String
    @Binding var date: Date
    var cityPlaceholder: String
    var dateTitle: String
    var label: String
    var openLocationSearch: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 5) {
                Text(LocalizedStringKey(label)).font(.caption).foregroundColor(.secondary)
                Button(
                    action: openLocationSearch,
                    label: {
                        Text(LocalizedStringKey(city.isEmpty ? TripVault.flightSearchAirports.name : city))
                            .padding(6)
                            .foregroundColor(city.isEmpty ? .gray : .black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                )
                .background(Color(UIColor.secondarySystemFill))
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .foregroundColor(.black)
            }
            // TODO: date format - MMM d
            HStack {
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
            label: TripVault.transportDepart.name,
            openLocationSearch: {}
        )
    }
}
