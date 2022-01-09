import UIKit

enum TextFieldType {
    case email
    case password
    case seach
    case normal
    
    var placeholer: String {
        switch self {
        case .email: return "Email"
        case .password: return "Senha"
        case .seach: return "Buscar..."
        case .normal: return ""
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .email: return .emailAddress
        case .seach: return .webSearch
        case .password, .normal: return .default
        }
    }
    
    var returnType: UIReturnKeyType {
        switch self {
        case .email: return .next
        case .password: return .go
        case .seach: return .search
        case .normal: return .default
        }
    }
}
