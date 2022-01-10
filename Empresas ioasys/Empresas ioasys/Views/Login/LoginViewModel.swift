import Foundation

class LoginViewModel {
    let apiHandler = LoginHandler()
    var onLoginSuccessful: (() -> Void)?
    var onLoginFailed: (() -> Void)?
    var login = ""
    var password = ""
    
    func validate() {
        
    }
    
    func tryLogin() {
        let loginData = LoginModel(login: login, password: password)
        apiHandler.loginWith(loginData: loginData) { response in
            if response == .success {
                DispatchQueue.main.async {
                    self.onLoginSuccessful?()
                }
            } else {
                DispatchQueue.main.async {
                    self.onLoginFailed?()
                }
            }
        }
    }
}
