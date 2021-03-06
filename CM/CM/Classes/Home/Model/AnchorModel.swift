//
//  AnchorModel.swift
//  CM
//
//  Created by aZu on 2020/12/22.
//

import UIKit
import YYModel

class AnchorModel: NSObject {

    @objc var room_id : Int = 0
    
    @objc var vertical_src : String?
    
    @objc var isVertical :Int = 0
    
    @objc var room_name :String?
    
    @objc var nickname :String?
    
    @objc var online :Int = 0
    
    @objc var anchor_city : String? 
    
    
    override var description: String{
        
        return yy_modelDescription()
    }
    
//    init(dict:[String : Any]) {
//        super.init()
//
//        setValuesForKeys(dict)
//    }
//
//    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//
//    }
    
}
