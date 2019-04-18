//
//  ButtonLayerViewController.swift
//  SJSwiftProject
//
//  Created by Byunsangjin on 18/04/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import UIKit

class ButtonLayerViewController: UIViewController {
    // MARK:- Outlets
    @IBOutlet var button: ButtonLayer!
    
    
    
    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    // MARK:- Actions
    @IBAction func radiusSlide(_ sender: UISlider) {
        let radiusValue = sender.value
        button.cornerRadius = CGFloat(radiusValue)
    }
    
    
    
    @IBAction func widthSlide(_ sender: UISlider) {
        let borderWidth = sender.value
        button.borderWidth = CGFloat(borderWidth)
    }
}
