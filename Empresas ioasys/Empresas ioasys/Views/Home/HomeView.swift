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
    
}

extension HomeView {
    func setupView() {
        addSubview(navigationBar)
        backgroundColor = .white
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            navigationBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.28),
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
}

