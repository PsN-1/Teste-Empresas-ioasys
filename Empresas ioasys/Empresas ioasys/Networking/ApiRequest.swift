import Foundation

enum ApiMethod: String {
    case POST = "POST"
    case GET = "GET"
}

enum LoginResponse {
    case success
    case failed
}

class ApiRequest {
    private let baseURL = "https://empresas.ioasys.com.br/api"
    private let apiVersion = "v1"
    private let userCredentials = User.shared
    
    func buildRequest(with url: URL, forMethod method: ApiMethod, withHeaders headers: [String:String]?) -> URLRequest {
        let autenticationHeaders = [
            "Content-Type": "application/json",
            "access-token": "\(userCredentials.accessToken ?? "")",
            "client": "\(userCredentials.client ?? "")",
            "uid": "\(userCredentials.uid ?? "")"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        autenticationHeaders.forEach({ request.setValue($0.value, forHTTPHeaderField: $0.key) })
        headers?.forEach({ request.setValue($0.value, forHTTPHeaderField: $0.key) })
        
        return request
    }
    
    func buildURL(url: UrlPath, withParams params: [String:String]?) -> URLComponents {
        var urlPath = "\(baseURL)/\(apiVersion)/\(url.description)"
        if url == UrlPath.image(url: url.description) {
            urlPath = "https://empresas.ioasys.com.br\(url.description)"
        }
        
        var urlComponent = URLComponents(string: urlPath)!
        urlComponent.queryItems = params?.map( { URLQueryItem(name: $0.key, value: $0.value) })
        
        return urlComponent
    }
}
