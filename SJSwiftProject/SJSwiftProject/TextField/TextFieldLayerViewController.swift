//
//  TextFieldLayerViewController.swift
//  SJSwiftProject
//
//  Created by Byunsangjin on 19/04/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import UIKit

class TextFieldLayerViewController: UIViewController {
    // MARK:- Outlets
    @IBOutlet var textField: TextFieldLayer!
    
    
    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // MARK:- Actions
    @IBAction func widthSlide(_ sender: UISlider) {
        let width = sender.value
//        print(width)
        textField.borderWidth = CGFloat(width)
    }
}
