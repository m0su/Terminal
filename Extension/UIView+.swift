enum BorderSide {
    case left, right, top, bottom, all
}
// 선언
extension UIView {
    func setBorder(color: UIColor = .clear, width: CGFloat = 1, radius: CGFloat = 5, position: BorderSide = .all) {
        // top
        let frameSize = self.frame.size
        var borderRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        switch position {
        case .left:
            borderRect = CGRect(x: 0, y: 0, width: width, height: frameSize.height)
        case .right:
            borderRect = CGRect(x: frameSize.width, y: 0, width: width, height: frameSize.height)
        case .top:
            borderRect = CGRect(x: 0, y: 0, width: frameSize.width, height: width)
        case .bottom:
            borderRect = CGRect(x: 0, y: frameSize.height - width, width: frameSize.width, height: width)
        case .all:
            fallthrough
        default:
            self.layer.borderColor = color.cgColor
            self.layer.borderWidth = width
            self.layer.cornerRadius = radius
            return
        }
        
        let _ = CALayer().then {
            $0.backgroundColor = color.cgColor
            $0.frame = borderRect
            $0.cornerRadius = radius
            self.layer.addSublayer($0)
        }
    }

    func setShadow(color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 1.0
    }

    func makeCircle(borderWidth: CGFloat = 1, borderColor: UIColor) {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = true
    }

    func startBlink() {
        UIView.animate(withDuration: 0.7,
                       delay: 0.0,
                       options: [.autoreverse, .repeat],
                       animations: {
                        self.alpha = 0
        }, completion: nil)
    }

    func stopBlink() {
        alpha = 1
        layer.removeAllAnimations()
    }

    func shake() {
        let animation = CABasicAnimation(keyPath: "position").then {
            $0.duration = 0.05
            $0.repeatCount = 3
            $0.autoreverses = true
            $0.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5, y: self.center.y))
            $0.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5, y: self.center.y))
        }
        self.layer.add(animation, forKey: "position")
    }

    func setGradientBackground(color: [UIColor], locations: [NSNumber]? = nil) {
        if color.contains(.clear) {
            self.layer.sublayers?.removeAll()
            return
        }
        
        let gradient: CAGradientLayer = CAGradientLayer().then {
            $0.frame = self.bounds
            $0.colors = color.map { $0.cgColor }
            $0.locations = locations
            self.layer.insertSublayer($0, at: 0)
        }
    }

    func appear(withDuration duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, options: UIView.AnimationOptions = [], animations: @escaping () -> Void = {}, completion: @escaping ((Bool) -> Void) = { (finished: Bool) -> Void in }) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
                self.alpha = 1
                animations()
            }, completion: completion)
        }
    }
    
    func disappear(withDuration duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, options: UIView.AnimationOptions = [], animations: @escaping () -> Void = {}, completion: @escaping ((Bool) -> Void) = { (finished: Bool) -> Void in }) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
                self.alpha = 0
                animations()
            }, completion: completion)
        }
    }
}
