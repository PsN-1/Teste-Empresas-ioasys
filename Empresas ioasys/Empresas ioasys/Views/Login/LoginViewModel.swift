import Foundation

class LoginViewModel {
    let apiHandler = LoginHandler()
    var onLoginSuccessful: (() -> Void)?
    var onLoginFailed: (() -> Void)?
    var login = ""
    var password = ""
    var showLoadingIndicator: ((Bool) ->Void)?
    
    func tryLogin() {
        showLoadingIndicator?(true)
        let loginData = LoginModel(login: login, password: password)
        apiHandler.loginWith(loginData: loginData) { response in
            if response == .success {
                DispatchQueue.main.async {
                    self.showLoadingIndicator?(false)
                    self.onLoginSuccessful?()
                }
            } else {
                DispatchQueue.main.async {
                    self.showLoadingIndicator?(false)
                    self.onLoginFailed?()
                }
            }
        }
    }
}
