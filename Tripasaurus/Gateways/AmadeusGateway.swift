import SwiftUI

class AmadeusGateway: ObservableObject {
    @Published var locationRequestStatus: RequestStatus = RequestStatus.notStarted

    var authorization: Authorization = Authorization()
    var tokenExpiration: Date = Date.now

    private func checkAccessToken() {
        if Date.now > tokenExpiration {
            print("token expired")
            self.locationRequestStatus = .failed
            return
            // TODO: request new access token
        }
    }

    private func missingUrlError(setRequestState: () -> Void) {
        // TODO: error handling
        setRequestState()
        print("Missing URL")
    }

    private func requestError(message: String, error: Any, setRequestState: () -> Void) {
        // TODO: error handling
        setRequestState()
        print(message, error)
    }

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

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                self.requestError(message: "Request error: ", error: error, setRequestState: {})
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
                        self.requestError(message: "Error decoding: ", error: error, setRequestState: {})
                    }
                }
            }
       }.resume()
    }
    
    func getAirports(matching searchText: String, completion: @escaping ([AirportDTO]) -> ()) {
        print("getAirports")
        self.locationRequestStatus = .inProgress
        self.checkAccessToken()

        guard let url = URL(string: "https://test.api.amadeus.com/v1/reference-data/locations?subType=AIRPORT&keyword=\(searchText)")
        else {
            self.missingUrlError { self.locationRequestStatus = .failed }
            return
        }

        var request = URLRequest(url: url)
        request.setValue("Bearer \(self.authorization.access_token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                self.requestError(message: "Request error: ", error: error, setRequestState: { self.locationRequestStatus = .failed })
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(AirportResponse.self, from: data)
                        self.locationRequestStatus = .succeded
                        completion(decodedUsers.data)
                    } catch let error {
                        self.requestError(message: "Error decoding: ", error: error, setRequestState: { self.locationRequestStatus = .failed })
                    }
                }
            }
       }.resume()
    }
    
    func getCities(matching searchText: String, completion: @escaping ([CityDTO]) -> ()) {
        self.locationRequestStatus = .inProgress
        self.checkAccessToken()

        guard let url = URL(string: "https://test.api.amadeus.com/v1/reference-data/locations/cities?keyword=\(searchText)")
        else {
            self.missingUrlError { self.locationRequestStatus = .failed }
            return
        }

        var request = URLRequest(url: url)
        request.setValue("Bearer \(self.authorization.access_token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                self.requestError(message: "Request error: ", error: error, setRequestState: { self.locationRequestStatus = .failed })
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(CityResponse.self, from: data)
                        self.locationRequestStatus = .succeded
                        completion(decodedUsers.data)
                    } catch let error {
                        self.requestError(message: "Error decoding: ", error: error, setRequestState: { self.locationRequestStatus = .failed })
                    }
                }
            }
       }.resume()
    }
}
