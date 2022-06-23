import SwiftUI

struct BudgetEdit: View {
    @Binding var budget: Double
    
    @Environment(\.dismiss) var dismiss
    @State var budgetCopy: Double = 0.0
    let decimalFormatter: NumberFormatter = NumberFormatter().decimal()

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(LocalizedStringKey(TripVault.budgetTotal.name))
                .font(.caption)
                .foregroundColor(.secondary)
            TextField(LocalizedStringKey(TripVault.budgetTotal.name), value: $budget, formatter: decimalFormatter)
                .textInputStyle()
                .keyboardType(.decimalPad)
            Spacer()
        }
        .padding()
        .onAppear { budgetCopy = budget }
        .navigationBarTitle(Text(LocalizedStringKey(TripVault.budgetEdit.name)), displayMode: .inline)
        .toolbar {
            SaveToolbar(isNew: false, isSaveDisabled: budget == 0.0, showCancelButton: true, cancelAction: cancel, saveAction: saveBudget)
        }
    }
}

struct BudgetEdit_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BudgetEdit(budget: .constant(Trip.example.budget))
        }
    }
}
