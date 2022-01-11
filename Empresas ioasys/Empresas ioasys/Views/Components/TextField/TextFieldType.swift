import UIKit

enum TextFieldType {
    case email
    case password
    case search
    case normal
    
    var placeholder: String {
        switch self {
        case .email: return "Email"
        case .password: return "Senha"
        case .search: return "Buscar..."
        case .normal: return ""
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .email: return .emailAddress
        case .search: return .webSearch
        case .password, .normal: return .default
        }
    }
    
    var returnType: UIReturnKeyType {
        switch self {
        case .email: return .next
        case .password: return .go
        case .search: return .search
        case .normal: return .default
        }
    }
    
    var errorMessage: String {
        switch self {
        case .email: return "Endereço de email inválido"
        case .password: return "Senha inválida"
        case .search, .normal: return ""
        }
    }
}
