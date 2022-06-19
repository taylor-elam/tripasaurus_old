import SwiftUI

struct FlightDetail: View {
    @Binding var reservation: FlightReservation

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d"
        return formatter
    }

    var body: some View {
        VStack {
            FlightMainDetails(reservation: $reservation, dateFormatter: dateFormatter)
                .frame(maxWidth: .infinity, alignment: .leading)
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
