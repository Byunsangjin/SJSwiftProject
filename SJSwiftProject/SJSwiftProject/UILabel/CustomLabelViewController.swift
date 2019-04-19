//
//  CustomLabelViewController.swift
//  SJSwiftProject
//
//  Created by Byunsangjin on 19/04/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import UIKit

class CustomLabelViewController: UIViewController {
    // MARK:- Outlets
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var testLabel: CustomLabel!
    
    
    
    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // MARK:- Actions
    @IBAction func stepperClick(_ sender: UIStepper) {
        let characterSpace = sender.value
        valueLabel.text = "Character Space : \(characterSpace)"
        testLabel.characterSpace = CGFloat(characterSpace)
    }
    
    
}
