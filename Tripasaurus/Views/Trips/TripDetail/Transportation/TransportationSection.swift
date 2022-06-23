import SwiftUI

struct TransportationSection: View {
    var body: some View {
        Section(content: {
            
        }, header: {
            Label(
                LocalizedStringKey(TripVault.transportationSectionHeader.name),
                systemImage: AppSymbol.transportation.name
            ).font(.title2).fontWeight(.bold)
        })
    }
}

struct TransportationSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TransportationSection()
        }.listStyle(.sidebar)
    }
}
