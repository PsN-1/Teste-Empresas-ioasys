import UIKit

class WelcomeView: UIView {
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var title = buildTitle()
    lazy var subTitle = buildSubTitle()
}

extension WelcomeView {
    func setupView() {
        addSubview(title)
        addSubview(subTitle)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor),
            subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            subTitle.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            subTitle.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension WelcomeView {
    func buildGenericLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.textColor = .white
        
        return label
    }
    
    func buildTitle() -> UILabel {
        let label = buildGenericLabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Boas vindas,"
        return label
    }
    
    func buildSubTitle() -> UILabel {
        let label = buildGenericLabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "Você está no Empresas."
        return label
    }
}


