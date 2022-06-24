import Foundation

enum TransportationMode: String, CaseIterable, Identifiable, Codable {
    case flight
    case train
    case bus
    case ferry
    case cruise

    static var `default` = TransportationMode.train
    static var transportCases = [
        TransportationMode.train, TransportationMode.bus, TransportationMode.ferry, TransportationMode.cruise
    ]
    
    var id: String { rawValue }
    var icon: String {
        switch self {
        case .flight: return "airplane"
        case .train: return "tram.fill"
        case .bus: return "bus.fill"
        case .ferry: return "car.ferry.fill"
        case .cruise: return "ferry.fill"
        }
    }
    var name: String { rawValue.capitalized }

    init(icon: String) {
        switch icon {
        case "airplane": self = .flight
        case "tram.fill": self = .train
        case "bus.fill": self = .bus
        case "car.ferry.fill": self = .ferry
        case "ferry.fill": self = .cruise
        default: self = .default
        }
    }
}
