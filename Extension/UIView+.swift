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
}
// 호출
let view = UIView()
view.setBorder(color: .white, width: 5, radius: 4, position: .bottom)