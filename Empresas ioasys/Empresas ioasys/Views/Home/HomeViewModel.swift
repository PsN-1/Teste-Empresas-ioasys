import Foundation
import UIKit

class HomeViewModel {
    var companiesData: [Enterprise]?
    var didStartSearching: (() -> Void)?
    var didEndSearching: (() -> Void)?
    
    func getSectionsCount() -> Int {
        companiesData?.count ?? 0
    }
    
    func getCellDataFor(index: Int) -> HomeViewCell.HomeViewCellData {
        let company = companiesData?[index]
        return HomeViewCell.HomeViewCellData(
            companyImage: company?.photo ?? "",
            companyName: company?.name ?? "")
    }
    
    func getSelectedCompany(at index: Int) -> Enterprise {
        companiesData?[index] ?? Enterprise(id: 0, name: "", photo: "", description: "")
    }
    
    func seachCompanyWith(_ text: String?) {
        didStartSearching?()
    }
}
