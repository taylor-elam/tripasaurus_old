import SwiftUI

struct TransportationNode: View {
    @Binding var city: String
    @Binding var date: Date
    var cityPlaceholder: String
    var dateTitle: String
    var label: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label).font(.caption).foregroundColor(.secondary)
            HStack {
                TextField(cityPlaceholder, text: $city)
                    .textInputStyle()
                // TODO: date format - MMM d
                DatePicker(dateTitle, selection: $date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
            }
        }
    }
}

struct TransportationNode_Previews: PreviewProvider {
    static var previews: some View {
        TransportationNode(
            city: .constant("Chicago, IL"),
            date: .constant(Date.now),
            cityPlaceholder: "Origin",
            dateTitle: "Departure Date",
            label: "Depart"
        )
    }
}
