import UIKit

class LoginTextField: UIView {
    override init(frame: CGRect = .zero) {
        self.fieldType = .normal
        super.init(frame: frame)
        setupField()
    }
    
    init(ofType fieldType: TextFieldType) {
        self.fieldType = fieldType
        super.init(frame: .zero)
        setupField()
    }
    var fieldType: TextFieldType
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var genericTextField = GenericTextField(ofType: fieldType)
    lazy var topLabel = buildGenericLabel()
    lazy var bottomLabel = buildGenericLabel()
    
    func setupField() {
        topLabel.text = fieldType.placeholder
        bottomLabel.text = fieldType.errorMessage
        bottomLabel.textColor = Colors.redText
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(genericTextField)
        addSubview(topLabel)
        addSubview(bottomLabel)
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: topAnchor),
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 16),
            
            genericTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            genericTextField.trailingAnchor.constraint(equalTo: trailingAnchor),

            genericTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            genericTextField.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            genericTextField.bottomAnchor.constraint(equalTo: bottomLabel.topAnchor),
            
            bottomLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            bottomLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLabel.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    func buildGenericLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.isHidden = true
        return label
    }
}



