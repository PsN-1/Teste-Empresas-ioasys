import UIKit

class HomeViewModel {
    private let searchHandler = SearchHandler()
    
    var companiesData: [Enterprise]?
    var didStartSearching: (() -> Void)?
    var didEndSearching: (() -> Void)?
    
    func getSectionsCount() -> Int {
        companiesData?.count ?? 0
    }
    
    func showNotFound() -> Bool {
        companiesData?.isEmpty ?? true
    }
    
    func getCellDataFor(index: Int) -> HomeViewCell.HomeViewCellData {
        let company = companiesData?[index]
        return HomeViewCell.HomeViewCellData(
            companyImage: company?.photo ?? "",
            companyName: company?.name ?? "")
    }
    
    func getSelectedCompany(at index: Int) -> Enterprise {
        companiesData?[index] ?? Enterprise()
    }
    
    func seachCompanyWith(_ text: String?) {
        didStartSearching?()
        if let searchText = text?.removeDetails() {
            if searchText.isEmpty {
                getAllCompanies()
            } else if searchText.isNumbersOnly() {
                getCompaniesById(searchText)
            } else if searchText.isLettersOnly() {
                getCompaniesByName(searchText)
            } else if searchText.contains("type") && searchText.hasNumbers() {
                getCompaniesByType(searchText)
            } else if searchText.hasLetters() && searchText.hasNumbers() {
                getCompaniesByNameAndType(searchText)
            } else {
                
            }
        }
    }
}

extension HomeViewModel {
    
    func getAllCompanies() {
        searchHandler.getAllCompanies { companies in
            self.updateCompanies(companies.enterprises)
        }
    }
    
    func getCompaniesById(_ id: String){
        searchHandler.getCompaniesBy(Int(id) ?? 0) { companies in
            self.updateCompanies(companies.enterprises)
        }
    }
    
    func getCompaniesByName(_ name: String) {
        searchHandler.getCompaniesFilterBy(name) { companies in
            self.updateCompanies(companies.enterprises)
        }
    }
    
    func getCompaniesByNameAndType(_ text: String) {
        let name = text.splitLetters()
        let companyType = text.splitNumbers()
        
        searchHandler.getCompaniesFilterBy(name, andCompanyType: Int(companyType) ?? 0) { companies in
            self.updateCompanies(companies.enterprises)
        }
    }
    
    func getCompaniesByType(_ text: String) {
        let companyType = text.splitNumbers()
        
        searchHandler.getcompaniesBy(companyType: Int(companyType) ?? 0) { companies in
            self.updateCompanies(companies.enterprises)
        }
    }
    
    func updateCompanies(_ companies: [Enterprise]) {
        DispatchQueue.main.async {
            self.companiesData = companies
            self.didEndSearching?()
        }
    }
}


