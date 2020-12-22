//
//  AnchorGroup.swift
//  CM
//
//  Created by aZu on 2020/12/22.
//

import UIKit

class AnchorGroup: NSObject {

    @objc var room_list : [[String : Any]]?{
        didSet{

            guard let room_list = room_list else {
                return
            }

            for dict in room_list{

                anchors.append(AnchorModel(dict: dict))

            }

        }

    }
   
    
    @objc var tag_name: String?
    
    @objc var icon_name : String? = "home_header_normal"
    
     lazy var anchors :[AnchorModel] = [AnchorModel]()
    
    
    init(dict : [String : Any]) {

        super.init()

        setValuesForKeys(dict)

    }

    //注意：此方法不是类方法
    override  func setValue(_ value: Any?, forUndefinedKey key: String) {

    }
    
//    override  func setValue(_ value: Any?, forKey key: String) {
//        if key == "room_list"{
//            if let dataArray = value as?[[String:Any]]{
//
//                for dict in dataArray {
//                    anchors.append(AnchorModel(dict: dict))
//                }
//
//            }
//        }
//    }
//
    
}
