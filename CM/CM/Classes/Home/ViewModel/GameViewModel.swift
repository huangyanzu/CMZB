//
//  GameViewModel.swift
//  CM
//
//  Created by aZu on 2020/12/25.
//

import UIKit

class GameViewModel {
    
    lazy var games:[GameModel] = [GameModel]()

}


extension GameViewModel{
    
    func loadAllGameData(completion:@escaping()->()){
        
        
        //http://capi.douyucdn.cn/api/v1/getColumnDetail?shortName
        NetWorkTool.sharedInstance.request(method: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["shortName" : "game"]) { (result) in
            
          
            
            
            guard  let resultDict = result as? [String : Any],
                   let dataArray = resultDict["data"] as? [[String:Any]],
                   let array = NSArray.yy_modelArray(with: GameModel.self, json:dataArray) as? [GameModel]
                   else{ return }
           
           
            
             self.games.append(contentsOf: array)
            
             completion()
            
        }
        
        
        
    }
    
    
    
}
