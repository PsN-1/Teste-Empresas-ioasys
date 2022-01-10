import UIKit

class CompanyDetailView: UIView {
    struct DetailViewData {
        var companyDetailName: String
        var companyDetailImage: String
        var companyDetailDescription: String
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    func setupViewData(_ data: DetailViewData) {
        companyDescription.text = data.companyDetailDescription
        title.text = data.companyDetailName
        companyImage.load(url: data.companyDetailImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(navigationBar)
        addSubview(title)
        addSubview(backButton)
        addSubview(companyImage)
        addSubview(companyDescription)
      
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navigationBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.19),
            
            title.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor, constant: 10),
            title.heightAnchor.constraint(equalToConstant: 30),
            
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            companyImage.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            companyImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            companyImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            companyImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            companyDescription.topAnchor.constraint(equalTo: companyImage.bottomAnchor, constant: 31),
            companyDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            companyDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            companyDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -47)
        ])
    }
    
    lazy var backButton: UIButton = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold, scale: .large)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left", withConfiguration: largeConfig), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "McDonnalds"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    lazy var navigationBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = Images.backgroundImage
        backgroundImage.clipsToBounds = true
        backgroundImage.contentMode = .scaleAspectFill
        
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }()
    
    lazy var companyImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return imageView
    }()
    
    lazy var companyDescription: UITextView = {
       let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.isScrollEnabled = true
        return textView
    }()
    
}
