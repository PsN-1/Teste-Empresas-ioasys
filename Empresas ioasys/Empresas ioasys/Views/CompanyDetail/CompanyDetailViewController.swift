import UIKit

class CompanyDetailViewController: UIViewController {
//    var viewModel = CompanyDetailViewModel()
    let companyDetailView = CompanyDetailView()
    
    override func loadView() {
        self.view = companyDetailView
    }
    
}
