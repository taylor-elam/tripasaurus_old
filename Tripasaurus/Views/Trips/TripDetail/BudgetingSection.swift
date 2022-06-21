import SwiftUI

struct BudgetingSection: View {
    @Binding var trip: Trip
    let currencyFormatter: NumberFormatter = NumberFormatter().currency()

    var body: some View {
        Section(content: {
            ForEach(trip.budgetItems, id: \.self) { budgetItem in
                if let formattedCost = currencyFormatter.string(from: budgetItem as NSNumber) {
                    Text(formattedCost)
                }
            }
        }, header: {
            Label(
                LocalizedStringKey(TripVault.budgetSectionHeader.name),
                systemImage: AppSymbol.budget.name
            ).font(.title2).fontWeight(.bold)
        })
    }
}

struct BudgetingSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            BudgetingSection(trip: .constant(Trip.example))
        }.listStyle(.sidebar)
    }
}
