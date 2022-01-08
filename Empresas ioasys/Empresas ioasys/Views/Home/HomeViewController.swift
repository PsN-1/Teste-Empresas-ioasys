import UIKit

private let reuseIdentifier = "Cell"

class HomeViewController: UIViewController {

    let homeView = HomeView()
    
    var viewModel = LoginViewModel()
    var onSelectedCompany: (() -> Void)?
    
    override func loadView() {
        self.view = homeView
        setupCollectionView()
        setupTitle()
    }
    
    func setupTitle() {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.text = "Pesquise por uma empresa"
        
        navigationItem.titleView = label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func setupCollectionView() {
        homeView.homeCollectionView?.register(HomeViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        homeView.homeCollectionView?.dataSource = self
        homeView.homeCollectionView?.delegate = self
        homeView.homeCollectionView?.contentInsetAdjustmentBehavior = .always
        homeView.homeCollectionView?.backgroundColor = .white
        
        navigationItem.hidesBackButton = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelectedCompany?()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        homeView.homeCollectionView?.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
}
    
