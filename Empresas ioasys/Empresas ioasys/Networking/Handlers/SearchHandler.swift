import Foundation
import SwiftUI

class SearchHandler: BaseHandler {
    func getAllCompanies(completionHandler: @escaping ((EnterpriseModel?) -> Void)) {
        let headers = [
            "Content-Type": "application/json",
            "access-token": "\(userCredentials.accessToken ?? "")",
            "client": "\(userCredentials.client ?? "")",
            "uid": "\(userCredentials.uid ?? "")"
        ]
        
        apiClient.doGet(
            forPath: .listCompanies,
            withHeader: headers,
            withParams: nil) { data, response, error in
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        if let dataResponse = data {
                            if let jsonData = try? self.parse(json: dataResponse, ofType: EnterpriseModel.self) {
                                completionHandler(jsonData)
                            }
                        }
                    }
                }
            }
    }
    
    func getCompaniesById(){}
    func getCompaniesFilterByName(){}
    func getCompaniesFilterByNameAndID(){}
    func getcompaniesByType(){}
    
}
