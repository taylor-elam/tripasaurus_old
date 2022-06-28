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

            if gateway.locationRequestStatus == .inProgress {
                ProgressView().progressViewStyle(.circular)
            }

            if gateway.locationRequestStatus == .succeded && $gateway.locations.isEmpty {
                Text(LocalizedStringKey(TripVault.transportNoLocationsFound.name)).foregroundColor(.gray)
            }

            ScrollView {
                ForEach($gateway.locations) { $location in
                    HStack {
                        Text(location.iataCode)
                        Text(location.address.cityName)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .listCardStyle()
                    .onTapGesture {
                        selectLocation("\(location.iataCode) \(location.address.cityName)")
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
