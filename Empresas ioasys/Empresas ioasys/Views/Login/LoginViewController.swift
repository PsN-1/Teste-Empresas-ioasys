import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    var viewModel = LoginViewModel()
    
    override func loadView() {
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDismissibleKeyboard()
        setupLoginButton()
    }
    
    @objc func loginButtonPressed() {
        view.endEditing(true)
        if validButton() {
            loginView.loginButton.isEnabled = false
            viewModel.login = loginView.emailField.text ?? ""
            viewModel.password = loginView.passwordField.text ?? ""
            viewModel.tryLogin()
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = Colors.purpleLayerBorder.cgColor
        textField.textColor = .black
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.layer.borderColor = UIColor.black.cgColor
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        shouldEnableButton()
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
        !(loginView.emailField.text?.isEmpty ?? true) && !(loginView.passwordField.text?.isEmpty ?? true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            
        case loginView.emailField:
            loginView.passwordField.becomeFirstResponder()
            
        case loginView.passwordField:
            textField.resignFirstResponder()
            loginButtonPressed()
            
        default: textField.resignFirstResponder()
        }
        
        return true
    }
    
    func setupDismissibleKeyboard() {
        loginView.emailField.delegate = self
        loginView.passwordField.delegate = self
        
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
            
            self.loginView.emailField.textColor = Colors.redText
            self.loginView.emailField.layer.borderColor = Colors.redLayer.cgColor
            
            self.loginView.passwordField.textColor = Colors.redText
            self.loginView.passwordField.layer.borderColor = Colors.redLayer.cgColor
            
            let alertController = GenericAlertController.presentWith(
                title: "Erro ao realizar login",
                message: "Endereço de email ou senha inválida",
                actionTitle: "Tentar Novamente"
            )
            self.present(alertController, animated: true)
        }
    }
}
