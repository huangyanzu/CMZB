//
//  AmuseViewController.swift
//  CM
//
//  Created by aZu on 2020/12/25.
//

import UIKit

private let kMenuViewH : CGFloat = 200

class AmuseViewController: BaseAnchorViewController {
    
    private lazy var amuseVM :AmuseViewModel = AmuseViewModel()
    
    private lazy var amuseMenuView :AmuseMenuView = {
        
        let menuView = AmuseMenuView.amuseMenuView()
        
        menuView.frame = CGRect(x: 0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)
        
        
        
        menuView.autoresizingMask = []
        
        return menuView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func setupUI() {
        super.setupUI()
        
        collectionView.addSubview(amuseMenuView)
        
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)
        
    }
  
}

extension AmuseViewController{
     override func loadData(){
        
        baseVM = amuseVM
        
        amuseVM.loadAmuseData {
            
            self.collectionView.reloadData()
            
            var tempGroups = self.amuseVM.anchorGroups
            tempGroups.removeFirst()
            self.amuseMenuView.groups = tempGroups
            
           // self.amuseMenuView.groups = self.amuseVM.anchorGroups
            
        }
        
    }
    
    
}


