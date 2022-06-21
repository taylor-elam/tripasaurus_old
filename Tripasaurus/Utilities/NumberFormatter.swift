import Foundation

extension NumberFormatter {
    func currency(decimalPlaces: Int = 2) -> NumberFormatter {
        self.numberStyle = .currency
        self.maximumFractionDigits = decimalPlaces
        return self
    }
}
