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
    
    func show(_ viewController: UIViewController) {
        navigationController.show(viewController, sender: self)
    }
}

extension MainCoordinator {
    func goToLogin() {
        let viewController = LoginViewController()
        viewController.viewModel.onLoginSuccessful = goToLoading
        show(viewController)
    }
    
    func goToLoading() {
        let viewController = LoadingViewController()
        viewController.viewModel.onLoadingComplete = { [weak self] companies in
            self?.goToHome(with: companies)
        }
        show(viewController)
    }
    
    func goToHome(with companies: [Enterprise]) {
        let viewController = HomeViewController()
        viewController.onSelectedCompany = { [weak self] company in
            self?.goToCompanyDetail(for: company)
        }
        viewController.viewModel.setCompaniesDataTo(companies)
        show(viewController)
    }
    
    func goToCompanyDetail(for company: Enterprise) {
        let viewController = CompanyDetailViewController()
        viewController.viewModel.setCompanyTo(company)
        viewController.onBackButtonPressed = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        show(viewController)
    }
}
