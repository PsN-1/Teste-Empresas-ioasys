import UIKit

extension UIImageView {
    func load(url: String) {
        self.image = reloadImage(url)
    }
    
    private func reloadImage(_ url: String, _ retryCount: Int = 2) ->  UIImage {
        if let cachedImage = CachedImages.shared.getImageFor(url: url) {
            return cachedImage
        }
        
        if retryCount > 0 {
            let apiClient = ApiClient()
            apiClient.doGetImage(for: url) {
               _ = self.reloadImage(url, retryCount-1)
            }
        }
        
        return UIImage()
    }
}
