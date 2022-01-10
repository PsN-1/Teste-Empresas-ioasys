import Foundation

enum DecodingJsonError: Error {
    case errorDecodingJson
}

class BaseHandler {
    let apiClient = ApiClient()
    let userCredentials = User.shared
    
    func parse<jsonData: Codable>(json: Data, ofType type: jsonData.Type) throws -> jsonData {
        let decoder = JSONDecoder()
        do {
            let jsonData: jsonData = try decoder.decode(jsonData.self, from: json)
            
            print("Data Parsed: ")
            print(jsonData)
            return jsonData
        } catch {
            print("Error decoding Json")
            throw DecodingJsonError.errorDecodingJson
        }
    }
}
