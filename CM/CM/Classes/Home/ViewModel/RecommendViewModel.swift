//
//  RecommendViewModel.swift
//  CM
//
//  Created by aZu on 2020/12/21.
//

import Foundation

class RecommendViewModel {
    
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    
    private lazy var hotGroup : [AnchorGroup] = [AnchorGroup]()
    
    private lazy var prettyGroup : [AnchorGroup] = [AnchorGroup]()
}

extension RecommendViewModel {
    
    func requestData(completion:@escaping()->()){
      
        let parameters = ["limit":"4","offset":"0","time":NSDate.getCurrentTime()]
        
        let group = DispatchGroup()
        
        group.enter()
        
        NetWorkTool.sharedInstance.request(method: .GET, URLString:"http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time":NSDate.getCurrentTime()]) { (result) in
            
            guard  let resultDict = result as? [String : Any],
                   let dataArray = resultDict["data"] as? [[String:Any]],
                   let array = NSArray.yy_modelArray(with: AnchorModel.self, json: dataArray) as? [AnchorModel] else{
                
                return
            }
            
            let anGroup = AnchorGroup()
            
            anGroup.tag_name = "热门"
            
            anGroup.icon_name = "home_header_hot"
            
            anGroup.room_list = array
            
            self.hotGroup.append(anGroup)
            
            group.leave()
            
        }
        
        
        
        //
        group.enter()
        NetWorkTool.sharedInstance.request(method: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) in
            
            guard  let resultDict = result as? [String : Any],
                   let dataArray = resultDict["data"] as? [[String:Any]],
                   let array = NSArray.yy_modelArray(with: AnchorModel.self, json: dataArray) as? [AnchorModel] else{
                
                return
            }
            
            let anGroup = AnchorGroup()
            
            anGroup.tag_name = "颜值"
            
            anGroup.icon_name = "home_header_phone"
            
            anGroup.room_list = array
            
            self.prettyGroup.append(anGroup)
            
            group.leave()
            
            
        }
        
        
        
        
        
        //http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1608528927
        
        group.enter()
        NetWorkTool.sharedInstance.request(method: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) { (result) in
           
            guard  let resultDict = result as? [String : Any],
                   let dataArray = resultDict["data"] as? [[String:Any]],
                   let array = NSArray.yy_modelArray(with: AnchorGroup.self, json: dataArray) as? [AnchorGroup] else{
                
                return
            }
            
            self.anchorGroups = array
        
            
            
            group.leave()

        }
        
        group.notify(queue: DispatchQueue.main) {
            
            self.anchorGroups.insert(contentsOf: self.prettyGroup, at: 0)
            
            self.anchorGroups.insert(contentsOf: self.hotGroup, at: 0)
            
            completion()
        }
        
        
    }
    
}
