//
//  FunnyViewController.swift
//  CM
//
//  Created by aZu on 2020/12/26.
//

import UIKit

private let kTopMargin :CGFloat = 8

class FunnyViewController: BaseAnchorViewController {

    lazy var funnyVM :FunnyViewModel = FunnyViewModel()
   
    
    
}

extension FunnyViewController{
    
    override func setupUI() {
        super.setupUI()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        collectionView.contentInset = UIEdgeInsets(top: kTopMargin, left: 0, bottom: 0, right: 0 )
        
    }
    
}

extension FunnyViewController{
    
    override func loadData() {
        
        baseVM = funnyVM
        
        funnyVM.loadFunnyData {
        
            self.collectionView.reloadData()
            
        }
        
        
        
    }
    
}
