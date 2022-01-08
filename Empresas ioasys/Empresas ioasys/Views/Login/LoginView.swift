import UIKit

class LoginView: UIView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var gradientView = GradientView()
    lazy var companyLogo = buildCompanyLogo()
    lazy var welcomeView = WelcomeView()
    
    lazy var field1: GenericTextField = {
        let field1 = GenericTextField()
        field1.setPlaceHolderTo("Email")
        return field1
    }()
    
    lazy var field2: GenericTextField = {
        let field2 = GenericTextField()
        field2.setPlaceHolderTo("Senha")
        return field2
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ENTRAR", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var textView: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Digite seus dados para continuar"
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.backgroundColor = .white
        textView.textColor = .black
        return textView
    }()
    
    lazy var loginView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white

        return view
    }()
    
    func setupView() {
        addSubview(gradientView)
        addSubview(loginView)
        addSubview(companyLogo)
        addSubview(welcomeView)
        
        addSubview(textView)
        addSubview(field1)
        addSubview(field2)
        addSubview(button)

        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            companyLogo.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: 80),
            companyLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 160),
            companyLogo.trailingAnchor.constraint(equalTo: trailingAnchor),
            companyLogo.heightAnchor.constraint(equalTo: companyLogo.widthAnchor, multiplier: 1.2),
            
            loginView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45),
            loginView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: bottomAnchor),
           
            welcomeView.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -30),
            welcomeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            textView.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 24),
            textView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 24),
            textView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -24),
            textView.heightAnchor.constraint(equalToConstant: 20),
            
            field1.heightAnchor.constraint(equalToConstant: 48),
            field1.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 25),
            field1.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -25),
            field1.topAnchor.constraint(equalTo: textView.topAnchor, constant: 40),
            
            field2.heightAnchor.constraint(equalToConstant: 48),
            field2.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 25),
            field2.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -25),
            field2.topAnchor.constraint(equalTo: field1.bottomAnchor, constant: 24),
            
            button.topAnchor.constraint(equalTo: field2.bottomAnchor, constant: 30),
            button.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -24),
            button.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}


extension LoginView {
    func buildCompanyLogo() -> UIImageView{
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.companyLogo
        view.contentMode = .scaleToFill
        return view
    }
}
