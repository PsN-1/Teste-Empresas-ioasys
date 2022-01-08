import UIKit

class HomeViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(backgroundImage)
        addSubview(companyImage)
        addSubview(companyLabel)
        
        NSLayoutConstraint.activate([
            backgroundImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            companyImage.topAnchor.constraint(equalTo: topAnchor),
            companyImage.heightAnchor.constraint(equalToConstant: 128),
            companyImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            companyImage.widthAnchor.constraint(equalToConstant: 88),
            
            companyLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor),
            companyLabel.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor),
            companyLabel.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor),
            companyLabel.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
    
    lazy var backgroundImage = CellGradientBackground()

    lazy var companyImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "companyImage")
        view.backgroundColor = .red
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()

    lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.text = "McDonalds"
        label.textColor = UIColor(red: 0.575, green: 0.575, blue: 0.575, alpha: 1)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 16
        label.clipsToBounds = true
        label.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return label
    }()
}


