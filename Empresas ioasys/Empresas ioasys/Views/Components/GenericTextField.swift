import UIKit

class GenericTextField: UITextField {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupField() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor

        attributedPlaceholder = NSAttributedString(
            string: "My Placeholder",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.102, green: 0.106, blue: 0.11, alpha: 1)])
        textColor = .black
        backgroundColor = .white
        
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 16, dy: 12)
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 16, dy: 12)
    }
    
    func setPlaceHolderTo(_ text: String) {
        placeholder = text
    }
    
    
}
