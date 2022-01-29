import UIKit

class CachedImages {
    private init() {}
    
    static let shared = CachedImages()
    private let cache = NSCache<NSString, UIImage>()

    func saveToCache(image: UIImage, for url: String) {
        let imageUrl = NSString(string: url)

        if cache.object(forKey: imageUrl) == nil {
            cache.setObject(image, forKey: imageUrl)
        }
    }
    
    func getImageFor(_ url: String) -> UIImage? {
        let imageUrl = NSString(string: url)
        return cache.object(forKey: imageUrl)
    }
}
