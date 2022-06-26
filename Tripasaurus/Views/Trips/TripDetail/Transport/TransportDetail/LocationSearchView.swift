import SwiftUI

class SearchBarViewModel: ObservableObject {
    @Published var text: String = ""
}

struct LocationSearchView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var gateway: AmadeusGateway
    @StateObject private var vm = SearchBarViewModel()
    var selectLocation: (String) -> Void

    var body: some View {
        VStack {
            TextField(LocalizedStringKey(AppVault.search.name), text: $vm.text)
                .textInputStyle()
                .onReceive(vm.$text.debounce(for: .seconds(1), scheduler: DispatchQueue.main)) {
                    guard $0.count >= 3 else { return }
                    gateway.getLocations(ofType: AmadeusLocationType.airport.name, matching: $0)
                }
            // TODO: add spinner
            // TODO: add no locations found

            ScrollView {
                ForEach($gateway.airports) { $airport in
                    HStack {
                        Text(airport.iataCode)
                        Text(airport.name)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .listCardStyle()
                    .onTapGesture {
                        selectLocation("\(airport.iataCode) \(airport.name)")
                        dismiss()
                    }
                }
            }
        }
        .padding(.horizontal)
        .background(Color(UIColor.secondarySystemBackground))
        .navigationBarTitle(LocalizedStringKey(TripVault.flightSearchAirports.name), displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: { dismiss() }, label: { Text(LocalizedStringKey(AppVault.cancel.name)) })
            }
        }
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationSearchView(selectLocation: { name in }).environmentObject(AmadeusGateway())
        }
    }
}
