import UIKit

class ImageHandler: BaseHandler {
    func getImage(url: String, completionHandler: @escaping ((UIImage) ->Void )) {
        apiClient.doGet(
            forPath: .image(url: url),
            withHeader: nil,
            withParams: nil) { data, response, error in
                
                if let data = data,
                   let image = UIImage(data: data) {
                    CachedImages.shared.saveToCache(image: image, for: url)
                    completionHandler(image)
                }
            }
    }
}
