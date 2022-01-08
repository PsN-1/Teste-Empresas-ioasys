import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToLogin()
    }
    
    func goToLogin() {
        let viewController = LoginViewController()
        viewController.onLoginSuccessful = goToHome
        navigationController.show(viewController, sender: self)
    }
    
    func goToLoading() {
        let viewController = LoadingViewController()
        navigationController.show(viewController, sender: self)
    }
    
    func goToHome() {
        let viewController = HomeViewController()
        viewController.onSelectedCompany = goToCompanyDetail
        navigationController.navigationBar.isHidden = false
        navigationController.show(viewController, sender: self)
    }
    
    func goToCompanyDetail() {
        let viewController = CompanyDetailViewController()
        navigationController.show(viewController, sender: self)
    }
    
}
