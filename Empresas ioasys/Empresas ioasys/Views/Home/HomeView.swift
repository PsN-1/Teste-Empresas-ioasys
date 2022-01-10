import UIKit

class HomeView: UIView {
    var homeCollectionView: HomeCollectionView?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let navigationBar = HomeNavigationBar()
    lazy var notFoundImage = buildNotFoundImageView()
    lazy var notFoundLabel = buildNotFoundLabel()
    lazy var activityIndicator =  buildActivityIndicator()
}

extension HomeView {
    func setupView() {
        addSubview(navigationBar)
        addSubview(notFoundImage)
        addSubview(notFoundLabel)
        addSubview(activityIndicator)
        
        backgroundColor = .white
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            navigationBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.28),
            
            notFoundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            notFoundImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            notFoundImage.heightAnchor.constraint(equalToConstant: 212),
            notFoundImage.widthAnchor.constraint(equalToConstant: 150),
            
            notFoundLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            notFoundLabel.topAnchor.constraint(equalTo: notFoundImage.bottomAnchor, constant: 16),
            notFoundLabel.heightAnchor.constraint(equalToConstant: 24),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        homeCollectionView = HomeCollectionView(frame: frame, collectionViewLayout: HomeCollectionView.createLayout())
        homeCollectionView?.backgroundColor = .green
        homeCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        if let homeCollectionView = homeCollectionView {
            addSubview(homeCollectionView)
            NSLayoutConstraint.activate([
                homeCollectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
                homeCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                homeCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                homeCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }
    }
    
    func buildNotFoundImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Images.companyNotFound
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }
    
    func buildNotFoundLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Empresa não encontrada"
        label.textColor = Colors.placeHolderColor
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.isHidden = true
        return label
    }
    
    func buildActivityIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .large
        indicator.startAnimating()
        indicator.color = .black
        indicator.isHidden = true
        return indicator
    }
}

