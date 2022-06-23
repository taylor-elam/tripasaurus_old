import Foundation

extension NumberFormatter {
    func currency(decimalPlaces: Int = 2) -> NumberFormatter {
        self.numberStyle = .currency
        self.minimumFractionDigits = decimalPlaces
        self.maximumFractionDigits = decimalPlaces
        return self
    }

    func decimal(decimalPlaces: Int = 2) -> NumberFormatter {
        self.minimumFractionDigits = decimalPlaces
        self.maximumFractionDigits = decimalPlaces
        return self
    }
}
