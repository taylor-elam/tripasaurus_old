import SwiftUI

struct BudgetProgress: View {
    var budget: Double
    var expenseTotal: Double
    let currencyFormatter: NumberFormatter = NumberFormatter().currency()

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ProgressView(currencyFormatter.string(from: budget as NSNumber)!, value: expenseTotal, total: budget)
                .progressViewStyle(RoundedRectProgressViewStyle())
            HStack {
                Text(currencyFormatter.string(from: expenseTotal as NSNumber)!).font(.callout)
                Spacer()
                Text(currencyFormatter.string(from: (budget - expenseTotal) as NSNumber)!).font(.callout)
            }
        }
        .padding(.vertical, 10)
    }
}

struct BudgetProgress_Previews: PreviewProvider {
    static var previews: some View {
        BudgetProgress(budget: 150.0, expenseTotal: 100.0)
    }
}
