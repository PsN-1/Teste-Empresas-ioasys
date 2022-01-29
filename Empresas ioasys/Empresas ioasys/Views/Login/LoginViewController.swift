import UIKit

class LoginViewController: UIViewController {
    private let loginView = LoginView()
    var viewModel = LoginViewModel()
    
    override func loadView() {
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDismissibleKeyboard()
        setupLoginButton()
        setupActivityIndicator()
    }
    
    @objc func loginButtonPressed() {
        view.endEditing(true)
        if validButton() {
            viewModel.login = loginView.emailField.genericTextField.text ?? ""
            viewModel.password = loginView.passwordField.genericTextField.text ?? ""
            viewModel.tryLogin()
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = Colors.purpleLayerBorder.cgColor
        textField.textColor = .black
        
        let isEmailField = textField == loginView.emailField.genericTextField
        let isPassordField = textField == loginView.passwordField.genericTextField
        
        if isEmailField {
            self.loginView.emailField.bottomLabel.isHidden = true
            self.loginView.emailField.topLabel.textColor = .black
        } else if isPassordField {
            self.loginView.passwordField.bottomLabel.isHidden = true
            self.loginView.passwordField.topLabel.textColor = .black
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.layer.borderColor = UIColor.black.cgColor
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        shouldEnableButton()
        
        let isEmailField = textField == loginView.emailField.genericTextField
        let isPasswordField =  textField == loginView.passwordField.genericTextField
        
        let isNotEmpty = !(textField.text?.isEmpty ?? true)
        let isEmpty = (textField.text?.isEmpty ?? true)
        
        if isEmailField && isNotEmpty {
            loginView.emailField.topLabel.isHidden = false
        } else if isPasswordField && isNotEmpty {
            loginView.passwordField.topLabel.isHidden = false
        } else if isEmailField && isEmpty {
            loginView.emailField.topLabel.isHidden = true
        } else if isPasswordField && isEmpty {
            loginView.passwordField.topLabel.isHidden = true
        }
    }
    
    func shouldEnableButton() {
        if validButton(){
            loginView.loginButton.isEnabled = true
            loginView.loginButton.backgroundColor = Colors.darkPurpleButton
        } else {
            loginView.loginButton.isEnabled = false
            loginView.loginButton.backgroundColor = .gray
        }
    }
    
    func validButton() -> Bool {
        !(loginView.emailField.genericTextField.text?.isEmpty ?? true)
        && !(loginView.passwordField.genericTextField.text?.isEmpty ?? true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            
        case loginView.emailField.genericTextField:
            loginView.passwordField.genericTextField.becomeFirstResponder()
            
        case loginView.passwordField.genericTextField:
            textField.resignFirstResponder()
            loginButtonPressed()
            
        default: textField.resignFirstResponder()
        }
        
        return true
    }
    
    func setupDismissibleKeyboard() {
        loginView.emailField.genericTextField.delegate = self
        loginView.passwordField.genericTextField.delegate = self
        
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

extension LoginViewController {
    func setupLoginButton() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        loginView.loginButton.isEnabled = false
        viewModel.onLoginFailed = {
            
            self.loginView.emailField.genericTextField.textColor = Colors.redText
            self.loginView.emailField.genericTextField.layer.borderColor = Colors.redLayer.cgColor
            
            self.loginView.passwordField.genericTextField.textColor = Colors.redText
            self.loginView.passwordField.genericTextField.layer.borderColor = Colors.redLayer.cgColor
            
            self.loginView.emailField.bottomLabel.isHidden = false
            self.loginView.passwordField.bottomLabel.isHidden = false
            
            self.loginView.emailField.topLabel.textColor = Colors.redText
            self.loginView.passwordField.topLabel.textColor = Colors.redText
            
        }
    }
}

extension LoginViewController {
    func setupActivityIndicator() {
        viewModel.showLoadingIndicator = { shouldShow in
            self.loginView.activityIndicator.isHidden = !shouldShow
        }
    }
}
