import UIKit

class GenericAlertController: UIViewController {
    static func presentWith(title: String, message: String, actionTitle: String, hasCancelButton: Bool = false) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default))

        if hasCancelButton {
            alertController.addAction(UIAlertAction(title: "cancel", style: .cancel))
        }
        
        return alertController
    }
}
