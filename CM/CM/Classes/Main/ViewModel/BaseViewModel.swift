//
//  BaseViewModel.swift
//  CM
//
//  Created by aZu on 2020/12/26.
//

import Foundation

class BaseViewModel{
    
    
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    
}

extension BaseViewModel{
    
    func loadAnchorData(isGroupData: Bool ,urlString:String ,parameters:[String:Any]? = nil,completion:@escaping()->()){
        
        
        // 
        
        
        NetWorkTool.sharedInstance.request(method: .GET, URLString:urlString , parameters: parameters) { (result) in
            
         
            
            guard let resultDict = result as? [String : Any],
                  let dataArray = resultDict["data"] as? [[String : Any]]
                  else{ return }
            
            if isGroupData{
                
                guard  let array = NSArray.yy_modelArray(with: AnchorGroup.self, json: dataArray) as? [AnchorGroup] else{ return }
                
                self.anchorGroups.append(contentsOf: array)
                
            }else{
          
                guard let array = NSArray.yy_modelArray(with: AnchorModel.self, json: dataArray) as? [AnchorModel] else {
                    
                    return
                }
                let group = AnchorGroup()
                group.room_list = array
                
                
                self.anchorGroups.append(group)
         
                
            }
            
            completion()
            
        }
        
        
    }
    
    
}
