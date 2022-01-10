import UIKit

extension UIImageView {
    func load(url: String) {
        let cachedImages = CachedImages.shared
        let imageHandler = ImageHandler()
        
        if cachedImages.isImageCachedFor(url: url) {
            self.image = cachedImages.getImageFor(url: url)
        } else {
            imageHandler.getImage(url: url) { receivedImage in
                self.image = receivedImage
            }
        }
    }
}
