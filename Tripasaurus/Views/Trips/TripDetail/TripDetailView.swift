import SwiftUI

struct TripDetailView: View {
    @Binding var trip: Trip

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var tripStore: TripStore
    @State var isNew = false
    @State var selection: String = ""
    @State var tripCopy: Trip = Trip()

    var body: some View {
        VStack {
            VStack {
                TextField("Title", text: $tripCopy.title)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                Divider().frame(height: 1)
                DateSection(
                    date: $tripCopy.startDate,
                    displayComponents: [.date],
                    id: "startDate",
                    isSelected: selection == "startDate",
                    label: "Start Date",
                    selectRow: selectDeselect,
                    timeFormat: .omitted
                )
                Divider().frame(height: 1)
                DateSection(
                    date: $tripCopy.endDate,
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

            List {
                Section(content: {
                    ForEach($trip.flights) { $flight in
                        Text(flight.departureCity)
                    }
                }, header: { Text("Flights").sectionHeaderStyle() })
            }

            Spacer()

            Button(role: .destructive, action: deleteTrip, label: { Label("Delete Trip", systemImage: "trash") })
        }
        .onAppear { tripCopy = trip }
        .background(Color(UIColor.secondarySystemBackground))
        .navigationBarTitle("", displayMode: .inline)
        // TODO: add styling to navbar
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                if isNew { Button("Cancel") { dismiss() } }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(isNew ? "Add" : "Save") { isNew ? addTrip(trip: tripCopy) : saveTrip() }
                    .disabled(tripCopy.title.isEmpty)
            }
        }
    }
}

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TripDetailView(trip: .constant(Trip.example)).environmentObject(TripStore())
        }
    }
}
