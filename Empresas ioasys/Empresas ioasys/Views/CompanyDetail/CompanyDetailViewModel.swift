import Foundation

class CompanyDetailViewModel {
    var company: Enterprise?
    
    func getCompanyImage() -> String {
        company?.photo ?? ""
    }
    
    func getCompanyDescription() -> String {
        company?.description ?? ""
    }
    
    func getCompanyName() -> String {
        company?.name ?? ""
    }
}
