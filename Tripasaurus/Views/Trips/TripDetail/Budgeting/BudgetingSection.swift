import SwiftUI

struct BudgetingSection: View {
    @Binding var trip: Trip
    @State var isShowingExpenseItems: Bool = false
    let currencyFormatter: NumberFormatter = NumberFormatter().currency()

    var body: some View {
        Section(content: {
            BudgetProgress(
                budget: $trip.budget,
                expenseTotal: trip.expenseTotal,
                expenseReports: trip.expenseReports
            )
            .onTapGesture { withAnimation(.linear) { isShowingExpenseItems.toggle() } }
            if isShowingExpenseItems {
                ForEach(trip.expenseReports) { expenseReport in
                    ForEach(expenseReport.items) { expenseItem in
                        HStack {
                            Image(systemName: expenseItem.symbol)
                            Text(expenseItem.title)
                            Spacer()
                            if let formattedCost = currencyFormatter.string(from: expenseItem.cost as NSNumber) {
                                Text(formattedCost)
                            }
                        }
                        // TODO: tap to navigate to flight
                    }
                }
            }
        }, header: {
            HStack {
                Image(systemName: AppSymbol.budget.name).resizeImage(width: 20, height: 20)
                Text(LocalizedStringKey(TripVault.budgetSectionHeader.name))
                    .font(.title2).fontWeight(.bold)
            }
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
