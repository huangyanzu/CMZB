//
//  FunnyViewModel.swift
//  CM
//
//  Created by aZu on 2020/12/26.
//

import UIKit
import Alamofire
class FunnyViewModel : BaseViewModel {

    
    
}

//
extension FunnyViewModel{
    
    func loadFunnyData(completion:@escaping()->()){
        
        //https://apiv2.douyucdn.cn/mgapi/live/listapp/mixList/0_0/20/20/ios?app_ver=6.380&client_sys=ios&version=4
        
        //http://capi.douyucdn.cn/api/v1/live?limit=20&offset=0
        
        loadAnchorData(isGroupData:false,urlString: "http://capi.douyucdn.cn/api/v1/live", parameters: ["limit" : "30", "offset" : "0"], completion: completion)
        
        
     
        
    }
    
}
