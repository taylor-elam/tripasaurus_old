import Foundation

struct Authorization: Codable {
    var type: String = ""
    var username: String = ""
    var application_name: String = ""
    var client_id: String = ""
    var token_type: String = ""
    var access_token: String = ""
    var expires_in: Int = 0
    var state: String = ""
    var scope: String = ""
}
