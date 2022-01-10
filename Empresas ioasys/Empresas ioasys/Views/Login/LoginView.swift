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
    
    lazy var emailField = GenericTextField(ofType: .email)
    lazy var passwordField = GenericTextField(ofType: .password)
    lazy var loginButton = buildLoginButton()
    lazy var textView = buildTextView()
    lazy var loginView = buildLoginView()
    lazy var activityIndicator = buildActivityIndicator()
    
    func setupView() {
        addSubview(gradientView)
        addSubview(loginView)
        addSubview(companyLogo)
        addSubview(welcomeView)
        
        addSubview(textView)
        addSubview(emailField)
        addSubview(passwordField)
        addSubview(loginButton)
        
        addSubview(activityIndicator)

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
            
            emailField.heightAnchor.constraint(equalToConstant: 48),
            emailField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 25),
            emailField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -25),
            emailField.topAnchor.constraint(equalTo: textView.topAnchor, constant: 40),
            
            passwordField.heightAnchor.constraint(equalToConstant: 48),
            passwordField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 25),
            passwordField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -25),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 24),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 48),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
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
    
    func buildLoginButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ENTRAR", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        return button
    }
    
    func buildTextView() -> UILabel {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Digite seus dados para continuar"
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.backgroundColor = .white
        textView.textColor = .black
        return textView
    }
    
    func buildLoginView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }
    
    func buildActivityIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .large
        indicator.startAnimating()
        indicator.color = .white
        indicator.isHidden = true
        return indicator
    }
}
