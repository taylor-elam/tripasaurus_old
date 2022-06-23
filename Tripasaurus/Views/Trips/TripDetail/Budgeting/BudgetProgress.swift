import SwiftUI

struct BudgetProgress: View {
    @Binding var budget: Double
    var expenseTotal: Double

    @State var isEditingBudget: Bool = false
    let currencyFormatter: NumberFormatter = NumberFormatter().currency()
    let decimalFormatter: NumberFormatter = NumberFormatter().decimal()

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(currencyFormatter.string(from: budget as NSNumber)!).font(.title)
            ProgressView(value: expenseTotal, total: budget)
                .progressViewStyle(RoundedRectProgressViewStyle())
            HStack {
                Text(currencyFormatter.string(from: expenseTotal as NSNumber)!).font(.callout)
                Spacer()
                Text(currencyFormatter.string(from: (budget - expenseTotal) as NSNumber)!).font(.callout)
            }
        }
        .padding(.vertical, 10)
        .onTapGesture { isEditingBudget.toggle() }
        .sheet(isPresented: $isEditingBudget) {
            NavigationView {
                BudgetEdit(budget: $budget)
            }
        }
    }
}

struct BudgetProgress_Previews: PreviewProvider {
    static var previews: some View {
        List {
            BudgetProgress(budget: .constant(150.0), expenseTotal: 100.0)
        }
    }
}
