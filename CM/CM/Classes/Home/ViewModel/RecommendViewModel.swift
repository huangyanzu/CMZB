//
//  RecommendViewModel.swift
//  CM
//
//  Created by aZu on 2020/12/21.
//

import Foundation

class RecommendViewModel {
    
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    
    
    
}

extension RecommendViewModel {
    
    func requestData(){
      
      
        
        //http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1608528927
        
        
        
        NetWorkTool.sharedInstance.request(method: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: ["limit":"4","offset":"0","time":NSDate.getCurrentTime()]) { (result) in
           
            guard  let resultDict = result as? [String : Any],
                   let dataArray = resultDict["data"] as? [[String:Any]],
                   let array = NSArray.yy_modelArray(with: AnchorGroup.self, json: dataArray) as? [AnchorGroup] else{
                
                return
            }
            
            self.anchorGroups = array
        
            
            

        }
        
    }
    
}
