import Foundation

class LoginViewModel {
    let apiHandler = LoginHandler()
    var onLoginSuccessful: (() -> Void)?
    
    func tryLogin() {
        let loginData = LoginModel(login: "testeapple@ioasys.com.br", password: "12341234")
        apiHandler.loginWith(loginData: loginData) { response in
            if response == .success {
                DispatchQueue.main.async {
                    self.onLoginSuccessful?()
                }
            }
        }
    }
}
