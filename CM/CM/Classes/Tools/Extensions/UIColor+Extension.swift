//
//  UIColor+Extension.swift
//  CM
//
//  Created by aZu on 2020/12/16.
//

import UIKit

extension UIColor {
    
    convenience  init( r : CGFloat, g: CGFloat , b : CGFloat) {
        
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
        
    }
    
}
