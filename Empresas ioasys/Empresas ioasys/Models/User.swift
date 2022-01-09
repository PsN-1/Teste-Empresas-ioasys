import Foundation

class User {
    static let shared = User()
    
    private init() {}
    
    private(set) var uid: String?
    private(set) var client: String?
    private(set) var accessToken: String?
    
    func setCredentials(uid: String, client: String, accessToken: String) {
        self.uid = uid
        self.client = client
        self.accessToken = accessToken
    }
    
}
