import UIKit

class CompanyDetailViewController: UIViewController {
    var onBackButtonPressed: (() -> Void)?
    var viewModel = CompanyDetailViewModel()
    private let companyDetailView = CompanyDetailView()
    
    override func loadView() {
        self.view = companyDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(Images.backgroundImage, for: .default)
        
        setupView()
    }
    
    func setupView() {
        let companyData = CompanyDetailView.DetailViewData(
            companyDetailName: viewModel.companyName,
            companyDetailImage: viewModel.companyImage,
            companyDetailDescription: viewModel.companyDescription
        )
        
        companyDetailView.setupViewData(companyData)
        companyDetailView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        onBackButtonPressed?()
    }
}

