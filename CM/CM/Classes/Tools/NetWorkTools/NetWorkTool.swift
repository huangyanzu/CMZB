//
//  NetWorkTool.swift
//  CM
//
//  Created by aZu on 2020/12/20.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}


class NetWorkTool {

    //创建单例
     static let sharedInstance = NetWorkTool()
     private init() {}
    
    /// 封装alamofire的get/post方法
    /// - Parameters:
    ///   - method: get/post
    ///   - URLString: URL
    ///   - paramsters: <#paramsters description#>
    ///   - completion: <#completion description#>
    /// - Returns: <#description#>
    func request(method:MethodType = .GET, URLString : String ,parameters:[String : Any]?,completion:@escaping(_ json:Any?)->()){
        
        if method == .GET {
            AF.request(URLString, method: .get, parameters: parameters).responseJSON { (response) in
                
                let json = response.value
                
                completion(json)
            }
        }else{
            
            AF.request(URLString, method: .post, parameters: parameters).responseJSON { (response) in
                
                
                
                let json = response.value
                
                completion(json)
            
            
        }
        
        }
        
        
    }
    
}
