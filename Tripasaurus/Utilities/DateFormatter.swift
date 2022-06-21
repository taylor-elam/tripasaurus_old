import Foundation

extension DateFormatter {
    func with(format: String) -> DateFormatter {
        self.dateFormat = format
        return self
    }
}
