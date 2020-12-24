//
//  CycleModel.swift
//  CM
//
//  Created by aZu on 2020/12/23.
//

import UIKit

class CycleModel: NSObject {

    @objc var title :String?
    
    @objc var pic_url : String?
    
    @objc var room : [AnchorModel]?
    
    /// 类函数 ：告诉第三方框架YY_Model如果遇到数组的属性，数组中的存放的是什么类。
    ///
    /// - Returns: <#description#>
    @objc class func modelContainerPropertyGenericClass() -> [String: AnyClass]? {

        return ["room": AnchorModel.self]
    }

    override var description: String{
        return yy_modelDescription()
    }
    
}
