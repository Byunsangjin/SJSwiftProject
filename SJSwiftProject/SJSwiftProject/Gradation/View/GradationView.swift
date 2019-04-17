import UIKit

@IBDesignable
class GradationView: UIView {
    
    // MARK:- Variables
    @IBInspectable var startColor: UIColor = UIColor.black {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.white {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.5, y: 0) {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0.5, y: 1) {
        didSet {
            setNeedsLayout()
        }
    }
    
    private var gradient: CAGradientLayer?
    
    
    
    // MARK:- Methods
    private func initGradation() {
        // 그라데이션이 이미 있다면 삭제한다.
        if let gradient = self.gradient {
            gradient.removeFromSuperlayer()
        }
        
        let gradient = createGradient()
        self.layer.insertSublayer(gradient, at: 0)
        self.gradient = gradient
    }
    
    
    
    private func updateGradient() {
        if let gradient = self.gradient {
            let startColor = self.startColor
            let endColor = self.endColor
            gradient.colors = [startColor.cgColor, endColor.cgColor]
            gradient.startPoint = CGPoint(x: startPoint.x, y: startPoint.y)
            gradient.endPoint = CGPoint(x: endPoint.x, y: endPoint.y)
        }
    }
    
    
    
    // 뷰의 자동크기 조절을 위해 layoutSubviews의 메소드를 이용
    override func layoutSubviews() {
        initGradation()
        updateGradient()
    }
    
    
    
    private func createGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        return gradient
    }
    
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initGradation()
        updateGradient()
    }
}
