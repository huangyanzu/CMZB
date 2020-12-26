//
//  FunnyViewModel.swift
//  CM
//
//  Created by aZu on 2020/12/26.
//

import UIKit

class FunnyViewModel : BaseViewModel {

    
    
}

//
extension FunnyViewModel{
    
    func loadFunnyData(completion:@escaping()->()){
        
        loadAnchorData(urlString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3", parameters: ["limit" : 30, "offset" : 0], completion: completion)
        
    }
    
}
