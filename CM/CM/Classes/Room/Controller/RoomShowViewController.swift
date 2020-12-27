//
//  RoomShowViewController.swift
//  CM
//
//  Created by aZu on 2020/12/27.
//

import UIKit

class RoomShowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         dismiss(animated: true, completion: nil)
    }
    

}
