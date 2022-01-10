import UIKit

class HomeNavigationBar: UIView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.154, green: 0.063, blue: 0.098, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Test"
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineHeightMultiple = 0.83
        
        label.attributedText = NSMutableAttributedString(string: "Pesquise por\numa empresa", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    lazy var searchBar = GenericTextField(ofType: .seach)
    
    private func setupView() {
        backgroundColor = .white
        addSubview(title)
        addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.bottomAnchor.constraint(equalTo: searchBar.topAnchor),
            
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 48),
            searchBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
}
