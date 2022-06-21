import SwiftUI

struct TripMainDetails: View {
    @Binding var trip: Trip
    @State var selection: ExpandableRow = .none

    func selectDeselect(row: ExpandableRow) {
        withAnimation(.linear) {
            selection = (selection == row) ? .none : row
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
                isSelected: selection == .startDate,
                label: TripVault.startDate.name,
                selectRow: { selectDeselect(row: .startDate) },
                timeFormat: .omitted
            )
            Divider().frame(height: 1)
            DateSection(
                date: $trip.endDate,
                displayComponents: [.date],
                isSelected: selection == .endDate,
                label: TripVault.endDate.name,
                selectRow: { selectDeselect(row: .endDate) },
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
