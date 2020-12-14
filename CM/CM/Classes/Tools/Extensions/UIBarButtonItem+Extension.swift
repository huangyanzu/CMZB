//
//  UIBarButtonItem+Extension.swift
//  CM
//
//  Created by aZu on 2020/12/14.
//

import UIKit

extension UIBarButtonItem {
    
//    class func createItem(imageName:String,highlightName:String,size:CGSize) ->UIBarButtonItem{
//        
//        let btn = UIButton()
//        
//        btn.setImage(UIImage(named: imageName), for: .normal)
//        btn.setImage(UIImage(named: highlightName), for: .highlighted)
//        
//        btn.frame = CGRect(origin: CGPoint.zero, size: size)
//        
//        return UIBarButtonItem(customView: btn)
//        
//        
//    }
    
    convenience init(imageName:String,highlightName:String = "",size:CGSize = CGSize.zero) {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        if  highlightName != "" {
            
            btn.setImage(UIImage(named: highlightName), for: .highlighted)
        }
        
        if size == .zero{
            btn.sizeToFit()
        }else{
            
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        
        self.init(customView:btn)
        
        
        
        
    }
    
    
}
