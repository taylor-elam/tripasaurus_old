import SwiftUI

struct BudgetingSection: View {
    @Binding var trip: Trip
    let currencyFormatter: NumberFormatter = NumberFormatter().currency()

    var body: some View {
        Section(content: {
            BudgetProgress(budget: $trip.budget, expenseTotal: trip.expenseTotal)
            // TODO: add budget sections to progress bar
            ForEach(trip.expenseItems) { expenseItem in
                HStack {
                    Image(systemName: AppSymbol.airplane.name)
                    Text(expenseItem.title)
                    Spacer()
                    if let formattedCost = currencyFormatter.string(from: expenseItem.cost as NSNumber) {
                        Text(formattedCost)
                    }
                }
                // TODO: tap to navigate to flight
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
