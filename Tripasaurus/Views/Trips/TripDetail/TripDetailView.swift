import SwiftUI

struct TripDetailView: View {
    @Binding var trip: Trip
    @State var selection: String = ""

    var body: some View {
        VStack {
            VStack {
                TextField("Title", text: $trip.title)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                Divider().frame(height: 1)
                DateSection(
                    date: $trip.startDate,
                    displayComponents: [.date],
                    id: "startDate",
                    isSelected: selection == "startDate",
                    label: "Start Date",
                    selectRow: selectDeselect,
                    timeFormat: .omitted
                )
                Divider().frame(height: 1)
                DateSection(
                    date: $trip.endDate,
                    displayComponents: [.date],
                    id: "endDate",
                    isSelected: selection == "endDate",
                    label: "End Date",
                    selectRow: selectDeselect,
                    timeFormat: .omitted
                )
            }
            .padding()
            .listCardStyle()
            .padding(.horizontal)

            Spacer()
        }
        .background(Color(UIColor.secondarySystemBackground))
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TripDetailView(trip: .constant(Trip.example))
        }
    }
}
