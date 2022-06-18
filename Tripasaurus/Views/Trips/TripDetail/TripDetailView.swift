import SwiftUI

struct TripDetailView: View {
    @Binding var trip: Trip

    var body: some View {
        VStack {
            VStack {
                TextField("Title", text: $trip.title)
                    .multilineTextAlignment(.center)
                    .font(.title2)
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
