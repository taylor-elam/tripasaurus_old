import SwiftUI

struct TripRow: View {
    @Binding var trip: Trip

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(trip.title).fontWeight(.bold)
            HStack {
                Text(trip.startDate.formatted(date: .abbreviated, time: .omitted))
                Text("—")
                Text(trip.endDate.formatted(date: .abbreviated, time: .omitted))
            }
            .font(.caption2)
        }
    }
}

struct TripRow_Previews: PreviewProvider {
    static var previews: some View {
        TripRow(trip: .constant(Trip.example))
            .previewLayout(.sizeThatFits)
    }
}
