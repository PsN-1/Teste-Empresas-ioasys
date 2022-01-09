import UIKit

class CompanyDetailViewController: UIViewController {
    var onBackButtonPressed: (() -> Void)?
    var viewModel = CompanyDetailViewModel()
    let companyDetailView = CompanyDetailView()
    
    
    override func loadView() {
        self.view = companyDetailView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(Images.backgroundImage, for: .default)
        
        setupView()
    }
    
    func setupView() {
        companyDetailView.companyDescription.text = viewModel.getCompanyDescription()
        companyDetailView.title.text = viewModel.getCompanyName()
        companyDetailView.companyImage.load(url: viewModel.getCompanyImage())
        
        companyDetailView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        onBackButtonPressed?()
    }
}

