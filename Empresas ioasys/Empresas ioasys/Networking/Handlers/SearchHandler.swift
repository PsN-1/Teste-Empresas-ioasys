import Foundation
import SwiftUI

class SearchHandler: BaseHandler {
    func getAllCompanies(completionHandler: @escaping ((EnterpriseModel) -> Void)) {
        getData(forPath: .listCompanies, withHeader: nil, withParams: nil) { data in
            completionHandler(data)
        }
    }
    
    func getCompaniesBy(_ id: Int, completionHandler: @escaping ((EnterpriseModel) -> Void)){
        getData(forPath: .showByIdPath(id: id), withHeader: nil, withParams: nil) { data in
            completionHandler(data)
        }
    }
    
    func getCompaniesFilterBy(_ name: String, completionHandler: @escaping ((EnterpriseModel) -> Void)){
        let params = ["name":"\(name)"]
        
        getData(forPath: .companiesWithNameFilter, withHeader: nil, withParams: params) { data in
            completionHandler(data)
        }
    }
    
    func getCompaniesFilterBy(_ name: String, andCompanyType companyType: Int, completionHandler: @escaping ((EnterpriseModel) -> Void)){
        let params = [
            "name": "\(name)",
            "enterprise_types": "\(companyType)"
        ]
        
        getData(forPath: .companiesIndexWithFilter, withHeader: nil, withParams: params) { data in
            completionHandler(data)
        }
    }
    
    func getcompaniesBy(companyType: Int, completionHandler: @escaping ((EnterpriseModel) -> Void)){
        let params = ["enterprise_types": "\(companyType)"]
        
        getData(forPath: .companyIndex, withHeader: nil, withParams: params) { data in
            completionHandler(data)
        }
    }
    
}

extension SearchHandler {
    
    func getData(forPath path: UrlPath, withHeader headers: [String:String]?, withParams params:[String:String]?, completionHandler: @escaping ((EnterpriseModel) -> Void)) {
        
        apiClient.doGet(
            forPath: path,
            withHeader: headers,
            withParams: params) { data, response, error in
                let json = self.handleResponse(data: data, response: response, error: error)
                completionHandler(json)
            }
    }
    
    func parse<jsonData: Codable>(json: Data, ofType type: jsonData.Type) throws -> jsonData {
        let decoder = JSONDecoder()
        do {
            let jsonData: jsonData = try decoder.decode(jsonData.self, from: json)
            return jsonData
        } catch {
            print("Error decoding Json")
            throw DecodingJsonError.errorDecodingJson
        }
    }
    
    func handleResponse(data: Data?, response: URLResponse?, error: Error?) -> EnterpriseModel {
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 200 {
                if let dataResponse = data {
                    if let jsonData = try? self.parse(json: dataResponse, ofType: EnterpriseModel.self) {
                        return jsonData
                    } else if let jsonData = try? self.parse(json: dataResponse, ofType: SingleEnterpriseModel.self) {
                        return EnterpriseModel(enterprises: [jsonData.enterprise])
                    }
                }
            }
        }
        return EnterpriseModel(enterprises: [Enterprise()])
    }
}
