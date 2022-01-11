import UIKit

extension UIImageView {
    func load(url: String) {
        let cachedImages = CachedImages.shared
        let imageHandler = ImageHandler()

        if let cachedImage = cachedImages.getImageFor(url: url) {
            self.image = cachedImage
        } else {
            imageHandler.getImage(url: url) { receivedImage in
                self.image = receivedImage
            }
        }

    }
}
