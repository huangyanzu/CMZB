//
//  GameModel.swift
//  CM
//
//  Created by aZu on 2020/12/25.
//

import UIKit

class GameModel: NSObject {

    @objc var tag_name : String?
    
    @objc var icon_url : String?
    
    override var description: String{
        return yy_modelDescription()
    }
    
}
