//
//  GradationViewController.swift
//  SJSwiftProject
//
//  Created by Byunsangjin on 16/04/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GradationViewController: UIViewController {
    // MARK:- Outlets
    @IBOutlet var startPx: UITextField!
    @IBOutlet var startPy: UITextField!
    @IBOutlet var endPx: UITextField!
    @IBOutlet var endPy: UITextField!
    
    @IBOutlet var startColorBtns: [UIButton]!
    @IBOutlet var endButtonBtns: [UIButton]!
    
    @IBOutlet var gradationView: GradationView!
    
    
    
    // MARK:- Variables
    var disposebag = DisposeBag()
    
    
    
    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
        setTextField()
    }
    
    @objc func endEditing() {
        self.view.endEditing(true)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.disposebag = DisposeBag()
    }
    
    
    
    func setTextField() {
        startPx.rx.text.orEmpty
            .map({ str in
                Float(str)
            })
            .subscribe(onNext: { point in
                if let point = point {
                    self.gradationView.startPoint.x = CGFloat(point)
                }
            }).disposed(by: disposebag)
        
        startPy.rx.text.orEmpty
            .map({ str in
                Float(str)
            })
            .subscribe(onNext: { point in
                if let point = point {
                    self.gradationView.startPoint.y = CGFloat(point)
                }
            }).disposed(by: disposebag)
        
        endPx.rx.text.orEmpty
            .map({ str in
                Float(str)
            })
            .subscribe(onNext: { point in
                if let point = point {
                    self.gradationView.endPoint.x = CGFloat(point)
                }
            }).disposed(by: disposebag)
        
        endPy.rx.text.orEmpty
            .map({ str in
                Float(str)
            })
            .subscribe(onNext: { point in
                if let point = point {
                    self.gradationView.endPoint.y = CGFloat(point)
                }
            }).disposed(by: disposebag)
    }
    
    
    
    // MARK:- Actions
    @IBAction func startColorClick(_ sender: Any) {
        startColorBtns.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    @IBAction func endColorClick(_ sender: Any) {
        endButtonBtns.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    @IBAction func colorClick(_ sender: UIButton) {
        let colorText = (sender.titleLabel?.text)!
        
        if sender.tag == 0 { // startColor
            let startColor = Color(rawValue: colorText)?.returnUIColor()
            gradationView.startColor = startColor!
        } else { // endColor
            let endColor = Color(rawValue: colorText)?.returnUIColor()
            gradationView.endColor = endColor!
        }
    }
}
