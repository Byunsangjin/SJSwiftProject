//
//  Color.swift
//  SJSwiftProject
//
//  Created by Byunsangjin on 16/04/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

import UIKit

enum Color: String {
    case red = "Red"
    case green = "Green"
    case blue = "Blue"
    case black = "Black"
    case white = "White"
    
    func returnUIColor() -> UIColor {
        switch self {
        case .red :
            return UIColor.red
        case .green :
            return UIColor.green
        case .blue :
            return UIColor.blue
        case .black :
            return UIColor.black
        case .white :
            return UIColor.white
        default:
            ()
        }
    }
}
