import Foundation

class LoadingViewModel {
    private let apiClient = ApiClient()
    private let searchHandler = SearchHandler()
    var companies: [Enterprise]?
    var onLoadingComplete: (([Enterprise]) -> Void)?
    
    func getAllCompaniesData() {
        searchHandler.getAllCompanies { companyData in
            DispatchQueue.main.async {
                self.companies = companyData.enterprises
                self.getImagesForCompanies()
            }
        }
    }
    
    func getImagesForCompanies() {
        if let companies = companies {
            apiClient.doGetImages(for: companies) {
                self.onLoadingComplete?(companies)
            }
        }
    }
}
