import Foundation

enum UrlPath: Equatable {
    case loginPath
    case listCompanies
    case showByIdPath(id: Int)
    case companiesWithNameFilter
    case companiesIndexWithFilter
    case companyIndex
    case image(url: String)
    
    var description: String {
        switch self {
        case .loginPath: return "users/auth/sign_in"
        case .listCompanies: return "enterprises"
        case .showByIdPath(let id): return "enterprises/\(id)"
        case .companiesWithNameFilter: return "enterprises"
        case .companiesIndexWithFilter: return "enterprises"
        case .companyIndex: return "enterprises"
        case .image(let url): return "\(url)"
        }
    }
}
