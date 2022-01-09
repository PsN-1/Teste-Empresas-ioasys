import Foundation

class LoginViewModel {
    let apiClient = ApiClient()
    var onLoginSuccessful: (() -> Void)?
    
    func tryLogin() {
        
        let loginData = LoginModel(login: "testeapple@ioasys.com.br", password: "12341234")
        
        apiClient.doPost(loginData: loginData) { response in
            if response == .success {
                DispatchQueue.main.async {
                    self.onLoginSuccessful?()
                }
            }
        }
    }
}
