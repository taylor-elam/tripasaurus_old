import Foundation

extension Date {
    func add(days: Int) -> Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: days, to: self)?.startOfDay ?? self.startOfDay
    }
    
    func add(hours: Int) -> Date {
        Calendar.autoupdatingCurrent.date(byAdding: .hour, value: hours, to: self) ?? self
    }

    func add(minutes: Int) -> Date {
        Calendar.autoupdatingCurrent.date(byAdding: .minute, value: minutes, to: self) ?? self
    }

    func add(seconds: Int) -> Date {
        Calendar.autoupdatingCurrent.date(byAdding: .second, value: seconds, to: self) ?? self
    }
    
    func hour(_ hour: Int) -> Date {
        Calendar.autoupdatingCurrent.date(bySetting: .hour, value: hour, of: self) ?? self
    }
    
    func minute(_ minute: Int) -> Date {
        Calendar.autoupdatingCurrent.date(bySetting: .minute, value: minute, of: self) ?? self
    }

    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}
