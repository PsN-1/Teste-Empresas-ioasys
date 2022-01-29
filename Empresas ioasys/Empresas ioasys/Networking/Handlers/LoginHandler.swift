import Foundation

class LoginHandler: BaseHandler {
    
    func loginWith(loginData: LoginModel, completionHandler: @escaping ((LoginResponse) -> Void)) {
        let statusCodeSuccess = 200
        
        let json = [
            "email" : "\(loginData.login)",
            "password" : "\(loginData.password)"
        ]
        
        let body = try! JSONSerialization.data(withJSONObject: json, options: [])
        
        apiClient.doPost(
            forPath: .loginPath,
            withHeader: ["Content-Type": "application/json"],
            withParams: nil,
            withBody: body) { data, response, error in
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == statusCodeSuccess {
                        self.saveUserCredentialsFrom(httpResponse)
                        completionHandler(.success)
                    } else {
                        completionHandler(.failed)
                    }
                }
            }
    }
    
    func saveUserCredentialsFrom(_ httpResponse: HTTPURLResponse) {
        let uid = httpResponse.value(forHTTPHeaderField: "uid")
        let client = httpResponse.value(forHTTPHeaderField: "client")
        let accessToken = httpResponse.value(forHTTPHeaderField: "access-token")
        
        if let uid = uid,
           let client = client,
           let accessToken = accessToken {
            print("access-token: \(accessToken), uid: \(uid), client: \(client)")
            User.shared.setCredentials(uid: uid, client: client, accessToken: accessToken)
        }
    }
}
