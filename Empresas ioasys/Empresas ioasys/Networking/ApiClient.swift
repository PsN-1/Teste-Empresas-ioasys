import Foundation

enum ApiMethod: String {
    case POST = "POST"
    case GET = "GET"
}

enum UrlPath {
    static let loginPath = "/users/auth/sign_in"
    static let enterpriseIndexPath = "/enterprises?enterprise_types=3"
    static let showByIdPath = "/enterprises/1"
    static let enterprisesIndexWithFilterPath = "/enterprises?enterprise_types=1&name=aQm"
    static let enterprisesWithNameFilterPath = "/enterprises?name=ioasys"
}

class ApiClient {
    private let baseURL = "https://empresas.ioasys.com.br/api"
    private let apiVersion = "v1"
    private let session = URLSession.shared
    
    func buildRequest(
        with url: URL,
        forMethod method: ApiMethod,
        withHeaders headers: [String:String]?
    ) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers?.forEach({ request.setValue($0.value, forHTTPHeaderField: $0.key) })
        
        return request
    }
    
    func buildURL(url: String, withParams params: [String:String]?) -> URLComponents {
        var urlComponent = URLComponents(string: url)!

        urlComponent.queryItems = params?.map( { URLQueryItem(name: $0.key, value: $0.value) })
        return urlComponent
    }
    
    func doPost(loginData: LoginModel) {
        let loginUrl = "\(baseURL)/\(apiVersion)/users/auth/sign_in"
        let apiUrl = URL(string: loginUrl)!
        
        let request = buildRequest(
            with: apiUrl,
            forMethod: .POST,
            withHeaders: ["Content-Type": "application/json"]
        )
        
        let json = [
            "email" : "\(loginData.login)",
            "password" : "\(loginData.password)"
        ]
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            
            if error != nil { }
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                if httpResponse.statusCode == 200 {
                    print("Login Succesfull")
                    let uid = httpResponse.value(forHTTPHeaderField: "uid")
                    let client = httpResponse.value(forHTTPHeaderField: "client")
                    let accessToken = httpResponse.value(forHTTPHeaderField: "access-token")
                }
            }
        }
        
        task.resume()
    }
    
    func doGet() {
        
    }
}
 
