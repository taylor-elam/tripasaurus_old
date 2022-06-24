import SwiftUI

struct BudgetProgress: View {
    @Binding var budget: Double
    var expenseTotal: Double
    var expenseReports: [ExpenseReport] = []

    @State var isEditingBudget: Bool = false
    let currencyFormatter: NumberFormatter = NumberFormatter().currency()
    let decimalFormatter: NumberFormatter = NumberFormatter().decimal()

    func getRoundedCorners(index: Int, lastIndex: Int) -> UIRectCorner {
        if index == 0 {
            return [.topLeft, .bottomLeft]
        } else if index == lastIndex {
            return [.topRight, .bottomRight]
        }
        return []
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(currencyFormatter.string(from: budget as NSNumber)!).font(.title)
                Spacer()
                Button(action: { isEditingBudget.toggle() }, label: { Image(systemName: "pencil") })
                    .buttonStyle(.plain)
            }
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: geometry.size.width, height: 24)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 0) {
                        ForEach(Array(expenseReports.enumerated()), id: \.offset) { index, expenseReport in
                            Rectangle()
                                .cornerRadius(10,
                                    corners: getRoundedCorners(index: index, lastIndex: expenseReports.count - 1)
                                )
                                .frame(width: expenseReport.total / [budget, expenseTotal].max()! * geometry.size.width, height: 24)
                                .foregroundColor(expenseReport.category.color)
                        }
                    }
                }
            }
            HStack {
                Text(currencyFormatter.string(from: expenseTotal as NSNumber)!).font(.callout)
                Spacer()
                Text(currencyFormatter.string(from: (budget - expenseTotal) as NSNumber)!).font(.callout)
            }
        }
        .padding(.vertical, 10)
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
            BudgetProgress(
                budget: .constant(Trip.example.budget),
                expenseTotal: Trip.example.expenseTotal,
                expenseReports: Trip.example.expenseReports
            )
        }
    }
}
