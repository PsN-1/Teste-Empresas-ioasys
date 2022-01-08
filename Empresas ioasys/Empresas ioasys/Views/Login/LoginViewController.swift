import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    
    var viewModel = LoginViewModel()
    var onLoginSuccessful: (() -> Void)?
    
    override func loadView() {
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        setupDismissibleKeyboard()
        
        loginView.button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    @objc func loginButtonPressed() {
        view.endEditing(true)
//        viewModel.tryLogin()
        onLoginSuccessful?()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.598, green: 0.294, blue: 0.742, alpha: 1).cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.layer.borderColor = UIColor.black.cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            
        case loginView.field1:
            loginView.field2.becomeFirstResponder()
            
        case loginView.field2:
            textField.resignFirstResponder()
            loginButtonPressed()
            
        default: textField.resignFirstResponder()
        }
        return true
    }
    
    func setupDismissibleKeyboard() {
        loginView.field1.delegate = self
        loginView.field1.returnKeyType = .next
        loginView.field1.keyboardType = .emailAddress
        
        loginView.field2.delegate = self
        loginView.field2.returnKeyType = .go
        loginView.field2.isSecureTextEntry = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            if view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        } else {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardViewEndFrame.height
            }
        }
    }
}

