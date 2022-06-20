import SwiftUI

struct TripMainDetails: View {
    @Binding var trip: Trip
    @State var selection: String = ""

    func selectDeselect(row: String) {
        withAnimation(.linear) {
            selection = (selection == row) ? "" : row
        }
    }

    var body: some View {
        VStack {
            TextField(LocalizedStringKey(TripVault.titlePlaceholder.name), text: $trip.title)
                .multilineTextAlignment(.center)
                .font(.title2)
            Divider().frame(height: 1)
            DateSection(
                date: $trip.startDate,
                displayComponents: [.date],
                id: "startDate",
                isSelected: selection == "startDate",
                label: TripVault.startDate.name,
                selectRow: selectDeselect,
                timeFormat: .omitted
            )
            Divider().frame(height: 1)
            DateSection(
                date: $trip.endDate,
                displayComponents: [.date],
                id: "endDate",
                isSelected: selection == "endDate",
                label: TripVault.endDate.name,
                selectRow: selectDeselect,
                timeFormat: .omitted
            )
        }
        .padding()
        .listCardStyle()
        .padding(.horizontal)
    }
}

struct TripMainDetails_Previews: PreviewProvider {
    static var previews: some View {
        TripMainDetails(trip: .constant(Trip.example))
    }
}
