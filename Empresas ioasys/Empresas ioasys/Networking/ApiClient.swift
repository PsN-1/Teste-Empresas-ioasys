import Foundation
import UIKit

enum ApiMethod: String {
    case POST = "POST"
    case GET = "GET"
}

enum LoginResponse {
    case success
    case failed
}

enum UrlPath {
    static let loginPath = "users/auth/sign_in"
    static let enterpriseIndexPath = "enterprises?enterprise_types=3"
    static let showByIdPath = "enterprises/"
    static let enterprisesIndexWithFilterPath = "enterprises?enterprise_types=1&name=aQm"
    static let enterprisesWithNameFilterPath = "enterprises?name=ioasys"
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
    
    func doPost(loginData: LoginModel, completionHandler: @escaping ((LoginResponse) -> Void)) {
        let loginUrl = "\(baseURL)/\(apiVersion)/\(UrlPath.loginPath)"
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
                    
                    if let uid = uid,
                       let client = client,
                       let accessToken = accessToken {
                        User.shared.setCredentials(uid: uid, client: client, accessToken: accessToken)
                        completionHandler(LoginResponse.success)
                    }
                }
            }
        }
        
        task.resume()
    }
    
    func doGet(completionHandler: @escaping ((EnterpriseModel) -> Void)) {
        let loginUrl = "\(baseURL)/\(apiVersion)/\(UrlPath.showByIdPath)"
        let apiUrl = URL(string: loginUrl)!
        
        let userCredentials = User.shared
        let request = buildRequest(
            with: apiUrl,
            forMethod: .GET,
            withHeaders: [
                "Content-Type": "application/json",
                "access-token": "\(userCredentials.accessToken ?? "")",
                "client": "\(userCredentials.client ?? "")",
                "uid": "\(userCredentials.uid ?? "")"
            ]
        )
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let dataResponse = data {
                        let jsonData = self.parse(json: dataResponse)
                        completionHandler(jsonData)
                    }
                }
            }
        }
        task.resume()
    }
    
    func parse(json: Data) -> EnterpriseModel {
        let decoder = JSONDecoder()
        do {
            let jsonData: EnterpriseModel = try decoder.decode(EnterpriseModel.self, from: json)
            
            print("Data Parsed: ")
            print(jsonData)
            return jsonData
        } catch {
            print("Error decoding Json")
            return EnterpriseModel(enterprises: [Enterprise]())
        }
    }
    
    func doGetImage(for url: String, completionHandler: @escaping (() -> Void)) {
        let company = Enterprise(photo: url)
        doGetImages(for: [company]) {
            completionHandler()
        }
    }
    
    func doGetImages(for companies: [Enterprise], completionHandler: @escaping (() -> Void)) {
        let dispatchGroup = DispatchGroup()
        let imagesUrls = companies.map( { $0.photo })
       
        imagesUrls.forEach { imageUrl in
            dispatchGroup.enter()
            if let url = URL(string: "https://empresas.ioasys.com.br\(imageUrl)") {
                let task = session.dataTask(with: url) { data, response, error in
                    
                    if let data = data,
                       let image = UIImage(data: data) {
                        CachedImages.shared.saveToCache(image: image, for: imageUrl)
                    }
                    dispatchGroup.leave()
                }
                task.resume()
            }
        }
        dispatchGroup.notify(queue: .main) {
            completionHandler()
        }
    }
}


