import Foundation

enum EventIcon: String, CaseIterable, Identifiable {
    case circle = "circle.fill"
    case square = "square.fill"
    case triangle = "triangle.fill"
    case diamond = "diamond.fill"
    case heart = "heart.fill"
    case star = "star.fill"
    case house = "house.fill"
    case work = "building.2.fill"
    case meeting = "person.3.fill"
    case ticket = "ticket.fill"
    case theatermasks = "theatermasks.fill"
    case fork = "fork.knife"
    case buildingColumns = "building.columns.fill"
    case tv = "tv.inset.filled"
    case radio = "radio.fill"
    case music = "music.note"
    case gamecontroller = "gamecontroller.fill"
    case books = "books.vertical.fill"
    case airplane = "airplane"
    case car = "car.fill"
    case train = "tram.fill"
    case subway = "tram.fill.tunnel"
    case bus = "bus.fill"
    case ferry = "ferry.fill"
    case bicycle = "bicycle"
    case walk = "figure.walk"
    case map = "map.fill"
    case mappin = "mappin.and.ellipse"
    case flag = "flag.fill"
    case camera = "camera.fill"
    case dice = "dice.fill"
    case paintbrush = "paintbrush.pointed.fill"
    case creditcard = "creditcard.fill"
    case banknote = "banknote.fill"
    case gift = "gift.fill"
    case bag = "bag.fill"
    case tag = "tag.fill"
    case bell = "bell.fill"
    case crown = "crown.fill"
    case briefcase = "briefcase.fill"
    case leaf = "leaf.fill"
    case globe = "globe.americas.fill"
    case cross = "cross.fill"
    case clock = "clock.fill"
    case comb = "comb.fill"
    case scissors = "scissors"
    case speaker = "speaker.wave.3.fill"
    case pawprint = "pawprint.fill"

    static var `default` = EventIcon.circle
    
    var id: String { self.rawValue }
    var name: String { self.rawValue }

    static func random() -> EventIcon {
        EventIcon.allCases.randomElement() ?? .default
    }
}
