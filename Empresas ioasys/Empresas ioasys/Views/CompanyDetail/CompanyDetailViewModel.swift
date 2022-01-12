import Foundation

class CompanyDetailViewModel {
     private var company: Enterprise?
    
    var companyImage: String {
        get { company?.photo ?? "" }
    }
    
    var companyDescription: String {
        get { company?.description ?? "" }
    }
    
    var companyName: String {
        get { company?.name ?? "" }
    }
    
    func setCompanyTo(_ company: Enterprise) {
        self.company = company
    }
}
