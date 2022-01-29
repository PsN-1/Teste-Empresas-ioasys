import UIKit

class HomeViewModel {
    typealias CellData = HomeViewCell.HomeViewCellData
    
    private let searchHandler = SearchHandler()
    private var companiesData: [Enterprise]?
    
    var didStartSearching: (() -> Void)?
    var didEndSearching: (() -> Void)?
    
    var numberOfSections: Int {
        get { companiesData?.count ?? 0 }
    }
    
    var showNotFoundImage: Bool {
        get { companiesData?.isEmpty ?? true }
    }
    
    func setCompaniesDataTo(_ companies: [Enterprise]) {
        companiesData = companies
    }
    
    func getCellDataFor(index: Int) -> CellData {
        let company = companiesData?[index]
        return CellData(
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
                return
            }
            
            if searchText.isNumbersOnly() {
                getCompaniesById(searchText)
                return
            }
            
            if searchText.isLettersOnly() {
                getCompaniesByName(searchText)
                return
            }
            
            if searchText.contains("type") && searchText.hasNumbers() {
                getCompaniesByType(searchText)
                return
            }
            
            if searchText.hasLetters() && searchText.hasNumbers() {
                getCompaniesByNameAndType(searchText)
                return
            }
        }
    }
}

extension HomeViewModel {
    
    private func getAllCompanies() {
        searchHandler.getAllCompanies { [weak self] companies in
            self?.updateCompanies(companies.enterprises)
        }
    }
    
    private func getCompaniesById(_ id: String){
        searchHandler.getCompaniesBy(Int(id) ?? 0) { [weak self] companies in
            self?.updateCompanies(companies.enterprises)
        }
    }
    
    private func getCompaniesByName(_ name: String) {
        searchHandler.getCompaniesFilterBy(name) { [weak self] companies in
            self?.updateCompanies(companies.enterprises)
        }
    }
    
    private func getCompaniesByNameAndType(_ text: String) {
        let name = text.splitLetters()
        let companyType = text.splitNumbers()
        
        searchHandler.getCompaniesFilterBy(name, andCompanyType: Int(companyType) ?? 0) { [weak self] companies in
            self?.updateCompanies(companies.enterprises)
        }
    }
    
    private func getCompaniesByType(_ text: String) {
        let companyType = text.splitNumbers()
        
        searchHandler.getcompaniesBy(companyType: Int(companyType) ?? 0) { [weak self] companies in
            self?.updateCompanies(companies.enterprises)
        }
    }
    
    private func updateCompanies(_ companies: [Enterprise]) {
        DispatchQueue.main.async {
            self.companiesData = companies
            self.didEndSearching?()
        }
    }
}


