import UIKit

class GenericTextField: UITextField {
    override init(frame: CGRect = .zero) {
        self.type = .normal
        super.init(frame: frame)
        setupField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(ofType type: TextFieldType) {
        self.type = type
        super.init(frame: .zero)
        setupField()
    }
    
    var type: TextFieldType
    var rightImageTapped = true
}

extension GenericTextField {
    func setupField() {
        setupTextFieldLayout()
        setupTextFieldType()
        setupRightView()
        setupLeftView()
    }
    
    func setupTextFieldLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = Colors.grayLayerBorder.cgColor
        textColor = .black
        backgroundColor = .white
        attributedPlaceholder = NSAttributedString(
            string: "My Placeholder",
            attributes: [NSAttributedString.Key.foregroundColor:
                            Colors.placeHolderColor
                        ])
    }
    
    func setupTextFieldType() {
        isSecureTextEntry = (type == .password)
        keyboardType = type.keyboardType
        placeholder = type.placeholer
        returnKeyType = type.returnType
    }
    
    func setupRightView() {
        let rightImageButton = UIButton(type: .custom)
        rightImageButton.setImage(UIImage(systemName: "eye"), for: .normal)
        rightImageButton.tintColor = .black
        rightImageButton.addTarget(self, action: #selector(eyeIconTapped), for: .touchUpInside)
        
        rightViewMode = (type == .password) ? .always : .never
        rightView = rightImageButton
    }
    
    @objc func eyeIconTapped() {
        rightImageTapped.toggle()
        isSecureTextEntry = rightImageTapped
    }
    
    func setupLeftView() {
        let leftImageButton = UIButton(type: .custom)
        leftImageButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        leftImageButton.tintColor = .black
        
        leftViewMode = (type == .seach) ? .always : .never
        leftView = leftImageButton
    }
}

extension GenericTextField {
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let offset: CGFloat = (type == .seach) ? 48 : 16
        return bounds.insetBy(dx: offset, dy: 12)
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let offset: CGFloat = (type == .seach) ? 48 : 16
        return bounds.insetBy(dx: offset, dy: 12)
    }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let length: CGFloat = 24
        return CGRect(
            x: CGFloat(frame.size.width - 40),
            y: CGFloat(frame.size.height / 2 - (length / 2)),
            width: CGFloat(length),
            height: CGFloat(length)
        )
    }
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let length: CGFloat = 24
        return CGRect(
            x: CGFloat(16),
            y: CGFloat(frame.size.height / 2 - (length / 2)),
            width: CGFloat(length),
            height: CGFloat(length)
        )
    }
}
