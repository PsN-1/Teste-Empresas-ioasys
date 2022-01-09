import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.navigationBar.isHidden = true
        goToLogin()
    }
    
    func goToLogin() {
        let viewController = LoginViewController()
        viewController.viewModel.onLoginSuccessful = goToLoading
        navigationController.show(viewController, sender: self)
    }
    
    func goToLoading() {
        let viewController = LoadingViewController()
        viewController.viewModel.onLoadingComplete = { companies in
            self.goToHome(with: companies)
        }
        navigationController.show(viewController, sender: self)
    }
    
    func goToHome(with companies: [Enterprise]) {
        let viewController = HomeViewController()
        viewController.onSelectedCompany = { company in
            self.goToCompanyDetail(for: company)
        }
        viewController.viewModel.companiesData = companies
        navigationController.show(viewController, sender: self)
    }
    
    func goToCompanyDetail(for company: Enterprise) {
        let viewController = CompanyDetailViewController()
        viewController.viewModel.company = company
        viewController.onBackButtonPressed = {
            self.navigationController.popViewController(animated: true)
        }
        navigationController.show(viewController, sender: self)
    }
    
}
