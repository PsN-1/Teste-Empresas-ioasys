import Foundation

class LoadingViewModel {
    let apiClient = ApiClient()
    var companies: [Enterprise]?
    var onLoadingComplete: (([Enterprise]) -> Void)?
    
    func getCompaniesData() {
        apiClient.doGet { data in
            DispatchQueue.main.async {
                self.companies = data.enterprises
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
