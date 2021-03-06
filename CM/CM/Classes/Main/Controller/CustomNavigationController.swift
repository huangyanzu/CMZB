//
//  CustomNavigationController.swift
//  CM
//
//  Created by aZu on 2020/12/27.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
        guard  let systemGes = interactivePopGestureRecognizer,
               let gesView = systemGes.view else{return}
        
        //targets
//        var count:UInt32 = 0
//       let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
//
//        for i  in 0..<count {
//            let ivar = ivars[Int(i)]
//            let name = ivar_getName(ivar)
//            print(String(cString: name!))
//        }
        
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else{return}
        
       
        
        guard let target = targetObjc.value(forKey: "target") else{return }
        
        let action = Selector(("handleNavigationTransition:"))
        
        let panGes = UIPanGestureRecognizer()
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
      
        viewController.hidesBottomBarWhenPushed = true 
        
        
        
        super.pushViewController(viewController, animated: animated)
    }
    
}
