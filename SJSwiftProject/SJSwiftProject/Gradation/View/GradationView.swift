//
//  GradationView.swift
//  SJSwiftProject
//
//  Created by Byunsangjin on 16/04/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import UIKit

@IBDesignable
class GradationView: UIView {
    
    // MARK:- Variables
    @IBInspectable var startColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var endColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.5, y: 0) {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0.5, y: 1) {
        didSet {
            updateGradient()
        }
    }
    
    private var gradient: CAGradientLayer?
    
    
    
    // MARK:- Methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initGradation()
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initGradation()
    }
    
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initGradation()
        updateGradient()
    }
    
    
    
    private func initGradation() {
        // 그라데이션이 이미 있다면 삭제한다.
        if let gradient = self.gradient {
            gradient.removeFromSuperlayer()
        }
        
        let gradient = createGradient()        
        self.layer.addSublayer(gradient)
        self.gradient = gradient
    }
    
    
    
    private func updateGradient() {
        if let gradient = self.gradient {
            let startColor = self.startColor ?? UIColor.clear
            let endColor = self.endColor ?? UIColor.clear
            gradient.colors = [startColor.cgColor, endColor.cgColor]
            gradient.startPoint = CGPoint(x: startPoint.x, y: startPoint.y)
            gradient.endPoint = CGPoint(x: endPoint.x, y: endPoint.y)
        }
    }
    
    
    
    private func createGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        
        return gradient
    }
    
    
    
    
}
