import UIKit

private let reuseIdentifier = "Cell"

class HomeViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {

    let homeView = HomeView()
    
    var viewModel = HomeViewModel()
    var onSelectedCompany: ((Enterprise) -> Void)?
    
    override func loadView() {
        self.view = homeView
        setupCollectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDismissibleKeyboard()
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
        viewModel.getSectionsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HomeViewCell
        cell?.setup(with: viewModel.getCellDataFor(index: indexPath.row))
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelectedCompany?(viewModel.getSelectedCompany(at: indexPath.row))
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        homeView.homeCollectionView?.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = Colors.purpleLayerBorder.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupDismissibleKeyboard() {
        homeView.navigationBar.searchBar.delegate = self
    }
}

