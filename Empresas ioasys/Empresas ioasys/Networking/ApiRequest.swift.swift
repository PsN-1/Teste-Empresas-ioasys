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
    private let timeout: TimeInterval = 4
    
    func buildRequest(with url: URL, forMethod method: ApiMethod, withHeaders headers: [String:String]?) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = timeout
        
        headers?.forEach({ request.setValue($0.value, forHTTPHeaderField: $0.key) })
        
        return request
    }
    
    func buildURL(url: UrlPath, withParams params: [String:String]?) -> URLComponents {
        
        let urlPath = "\(baseURL)/\(apiVersion)/\(url.description)"
        var urlComponent = URLComponents(string: urlPath)!
        urlComponent.queryItems = params?.map( { URLQueryItem(name: $0.key, value: $0.value) })
        return urlComponent
    }
}
