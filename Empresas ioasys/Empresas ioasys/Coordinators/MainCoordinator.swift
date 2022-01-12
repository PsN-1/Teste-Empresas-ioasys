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
        viewController.viewModel.onLoadingComplete = { [weak self] companies in
            self?.goToHome(with: companies)
        }
        navigationController.show(viewController, sender: self)
    }
    
    func goToHome(with companies: [Enterprise]) {
        let viewController = HomeViewController()
        viewController.onSelectedCompany = { [weak self] company in
            self?.goToCompanyDetail(for: company)
        }
        viewController.viewModel.setCompaniesDataTo(companies)
        navigationController.show(viewController, sender: self)
    }
    
    func goToCompanyDetail(for company: Enterprise) {
        let viewController = CompanyDetailViewController()
        viewController.viewModel.setCompanyTo(company)
        viewController.onBackButtonPressed = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        navigationController.show(viewController, sender: self)
    }
    
}
