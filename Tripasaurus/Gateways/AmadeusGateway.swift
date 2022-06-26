import SwiftUI

class AmadeusGateway: ObservableObject {
    @Published var airports: [Airport] = []
    @Published var authorization: Authorization = Authorization()
    var tokenExpiration: Date = Date.now

    func authorize() {
        guard let url = URL(string: "https://test.api.amadeus.com/v1/security/oauth2/token")
        else { fatalError("Missing URL") }
        
        let clientId = "nTHVUZaP4QfpspxohPhgsJ8EAXndyZ3f"
        let clientSecret = "GFaAkgzTrKijcKBT"
        let postString = "grant_type=client_credentials&client_id=\(clientId)&client_secret=\(clientSecret)"
        
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedAuthorization = try JSONDecoder().decode(Authorization.self, from: data)
                        self.authorization = decodedAuthorization
                        self.tokenExpiration = Date.now.add(seconds: decodedAuthorization.expires_in)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
       }

       dataTask.resume()
    }

    func getLocations(ofType subType: String, matching searchText: String) {
        if Date.now > tokenExpiration {
            print("token expired")
            return
        }

        guard let url = URL(string: "https://test.api.amadeus.com/v1/reference-data/locations?subType=\(subType)&keyword=\(searchText)")
        else { fatalError("Missing URL") }

        var request = URLRequest(url: url)
        request.setValue("Bearer \(self.authorization.access_token)", forHTTPHeaderField: "Authorization")

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(AirportLocationsResponse.self, from: data)
                        self.airports = decodedUsers.data
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
       }

       dataTask.resume()
    }
}