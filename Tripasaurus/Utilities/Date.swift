import Foundation

extension Date {
    func add(days: Int) -> Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: days, to: self)?.startOfDay ?? self.startOfDay
    }

    func add(hours: Int) -> Date {
        Calendar.autoupdatingCurrent.date(byAdding: .hour, value: hours, to: self) ?? self
    }

    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}
