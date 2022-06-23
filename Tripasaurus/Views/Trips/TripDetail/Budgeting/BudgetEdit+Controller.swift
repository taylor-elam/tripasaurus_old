import Foundation

extension BudgetEdit {
    func cancel() {
        dismiss()
    }

    func saveBudget() {
        budget = budgetCopy
        dismiss()
    }
}
