import UIKit

class CompanyDetailView: UIView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(companyImage)
        addSubview(companyDescription)
      
        NSLayoutConstraint.activate([
            companyImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            companyImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            companyImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            companyImage.heightAnchor.constraint(equalTo: companyImage.widthAnchor, multiplier: 0.65),
            
            companyDescription.topAnchor.constraint(equalTo: companyImage.bottomAnchor, constant: 31),
            companyDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            companyDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            companyDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -47)
        ])
    }
    
    lazy var companyImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "companyImageFull")
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return imageView
    }()
    
    lazy var companyDescription: UITextView = {
       let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isScrollEnabled = true
        
        textView.text = "McDonald's Corporation é a maior cadeia mundial de restaurantes de fast food de hambúrguer, servindo cerca de 68 milhões de clientes por dia em 119 países através de 37 mil pontos de venda. Com sede nos Estados Unidos, a empresa começou em 1940 como uma churrascaria operada por Richard e Maurice McDonald. Em 1948, eles reorganizaram seus negócios como uma hamburgueria que usava os princípios de uma linha de produção. O empresário Ray Kroc ingressou na empresa como franquiado em 1955. "
        return textView
    }()
    
}
