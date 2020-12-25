//
//  AmuseViewModel.swift
//  CM
//
//  Created by aZu on 2020/12/25.
//

import UIKit

class AmuseViewModel{

    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    
    
    
}

extension AmuseViewModel{
    func loadAmuseData(completion:@escaping()->()){
        
        NetWorkTool.sharedInstance.request(method: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", parameters: nil) { (result) in
            
            guard let resultDict = result as? [String : Any],
                  let dataArray = resultDict["data"] as? [[String : Any]],
                  let array = NSArray.yy_modelArray(with: AnchorGroup.self, json: dataArray) as? [AnchorGroup] else{ return }
            
            self.anchorGroups.append(contentsOf: array)
            
            completion()
            
        }
        
    }
}
