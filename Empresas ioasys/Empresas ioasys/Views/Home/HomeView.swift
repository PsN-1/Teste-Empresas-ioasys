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
    
    func setupView() {
        homeCollectionView = HomeCollectionView(frame: frame, collectionViewLayout: HomeCollectionView.createLayout())
        homeCollectionView?.backgroundColor = .green
        homeCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        if let homeCollectionView = homeCollectionView {
            addSubview(homeCollectionView)
            NSLayoutConstraint.activate([
                homeCollectionView.topAnchor.constraint(equalTo: topAnchor),
                homeCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                homeCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                homeCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }
    }
}

