//
//  GameViewController.swift
//  CM
//
//  Created by aZu on 2020/12/20.
//

import UIKit
import Alamofire


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
       
        
        AF.request("http://httpbin.org/get", method: .get).responseJSON { (json) in
            
            guard let result = json.value  else{
                
                print(json.error)
                return
            }
            
            print(result)
        }
        
    }
    

   

}
