import Foundation

class LoginViewModel {
    let apiClient = ApiClient()
    
    func tryLogin() {
        
        let loginData = LoginModel(login: "testeapple@ioasys.com.br", password: "12341234")
        apiClient.doPost(loginData: loginData)
    }
}
