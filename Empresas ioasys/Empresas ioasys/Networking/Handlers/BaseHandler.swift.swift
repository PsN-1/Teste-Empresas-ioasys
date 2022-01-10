import Foundation

enum DecodingJsonError: Error {
    case errorDecodingJson
}

class BaseHandler {
    let apiClient = ApiClient()
}
