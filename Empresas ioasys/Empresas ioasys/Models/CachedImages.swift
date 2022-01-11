import UIKit

class CachedImages {
    static let shared = CachedImages()
    private let cache = NSCache<NSString, UIImage>()

    func saveToCache(image: UIImage, for url: String) {
        let imageUrl = NSString(string: url)

        if cache.object(forKey: imageUrl) == nil {
            cache.setObject(image, forKey: imageUrl)
        }
    }
    
    func getImageFor(url: String) -> UIImage? {
        let imageUrl = NSString(string: url)
        return cache.object(forKey: imageUrl)
    }
}
