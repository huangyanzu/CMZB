//
//  AmuseViewModel.swift
//  CM
//
//  Created by aZu on 2020/12/25.
//

import UIKit

class AmuseViewModel:BaseViewModel{

  
    
    
    
}

extension AmuseViewModel{
    func loadAmuseData(completion:@escaping()->()){
        
       
        
        loadAnchorData(urlString:  "http://capi.douyucdn.cn/api/v1/getHotRoom/2", completion: completion)
        
    }
}
