//
//  NSDate+Extension.swift
//  CM
//
//  Created by aZu on 2020/12/21.
//

import Foundation

extension NSDate{
    
    class func getCurrentTime()->String{
        
        let nowDate = NSDate()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
        
        
    }
    
}
