import UIKit

class ApiClient {
    private let session = URLSession.shared
    
    func doGet(forPath path: UrlPath, withHeader headers: [String:String]?, withParams params :[String:String]?,completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        let apiRequest = ApiRequest()
        
        let urlComponent = apiRequest.buildURL(url: path, withParams: params)
        let url = urlComponent.url!
        
        let request = apiRequest.buildRequest(with: url, forMethod: .GET, withHeaders: headers)
        
        let task = session.dataTask(with: request) { data, response, error in
            completionHandler(data, response, error)
        }
        
        task.resume()
    }
    
    func doPost(forPath path: UrlPath, withHeader headers: [String:String]?, withParams params:[String:String]?, withBody body: Data, completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        let apiRequest = ApiRequest()
        
        let urlComponent = apiRequest.buildURL(url: path, withParams: params)
        let url = urlComponent.url!
        
        let request = apiRequest.buildRequest(with: url, forMethod: .POST, withHeaders: headers)
        
        let task = session.uploadTask(with: request, from: body) { data, response, error in
            completionHandler(data, response, error)
        }
        task.resume()
    }

    func doGetImages(for companiesPhotos: [String], completionHandler: @escaping (() -> Void)) {
        let dispatchGroup = DispatchGroup()
       
        companiesPhotos.forEach { imageUrl in
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
