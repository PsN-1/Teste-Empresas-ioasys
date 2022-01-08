import UIKit

class CellGradientBackground: UILabel {
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 152, height: 107)
        view.backgroundColor = .white

        let shadows = UIView()
        shadows.frame = view.frame
        shadows.clipsToBounds = false
        view.addSubview(shadows)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 16)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 10
        layer0.shadowOffset = CGSize(width: 0, height: 4)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)

        let shadowPath1 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 16)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 4
        layer1.shadowOffset = CGSize(width: 0, height: 2)
        layer1.bounds = shadows.bounds
        layer1.position = shadows.center
        shadows.layer.addSublayer(layer1)

        let shapes = UIView()
        shapes.frame = view.frame
        shapes.clipsToBounds = true
        view.addSubview(shapes)

        let layer2 = CALayer()
        layer2.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        layer2.bounds = shapes.bounds
        layer2.position = shapes.center
        shapes.layer.addSublayer(layer2)

        let image3 = Images.backgroundImage?.cgImage
        let layer3 = CALayer()
        layer3.contents = image3
        layer3.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 0, d: 3.08, tx: 0, ty: -1.04))
        layer3.bounds = shapes.bounds
        layer3.position = shapes.center
        shapes.layer.addSublayer(layer3)

        shapes.layer.cornerRadius = 16
        
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
