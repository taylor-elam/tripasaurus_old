import Foundation

struct Meta: Codable {
    var count: Int
    var links: Link
    
    struct Link: Codable {
        var `self`: String
    }
}
