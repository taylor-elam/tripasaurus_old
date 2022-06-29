import SwiftUI

class SearchBarViewModel: ObservableObject {
    @Published var text: String = ""
}

struct LocationSearchView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var gateway: AmadeusGateway
    @StateObject private var vm = SearchBarViewModel()
    var isFlight: Bool
    var selectLocation: (String) -> Void
    @State var airports: [AirportDTO] = []
    @State var cities: [CityDTO] = []

    var body: some View {
        VStack {
            TextField(LocalizedStringKey(AppVault.search.name), text: $vm.text)
                .textInputStyle()
                .onReceive(vm.$text.debounce(for: .seconds(1), scheduler: DispatchQueue.main)) {
                    guard $0.count >= 3 else { return }
                    isFlight
                    ? gateway.getAirports(matching: $0) { airports in self.airports = airports }
                    : gateway.getCities(matching: $0) { cities in self.cities = cities }
                }

            if gateway.locationRequestStatus == .inProgress {
                ProgressView().progressViewStyle(.circular)
            } else {
                if gateway.locationRequestStatus == .succeded && airports.isEmpty && cities.isEmpty {
                    Text(LocalizedStringKey(TripVault.transportNoLocationsFound.name)).foregroundColor(.gray)
                }
                
                ScrollView {
                    ForEach(airports) { airport in
                        Text("\(airport.iataCode) \(airport.address.cityName)")
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .listCardStyle()
                            .onTapGesture {
                                selectLocation("\(airport.iataCode) \(airport.address.cityName)")
                                dismiss()
                            }
                    }
                    
                    ForEach(cities) { city in
                        Text(city.displayName)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .listCardStyle()
                            .onTapGesture {
                                selectLocation(city.displayName)
                                dismiss()
                            }
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
            LocationSearchView(isFlight: true, selectLocation: { name in })
                .environmentObject(AmadeusGateway())
        }
    }
}
