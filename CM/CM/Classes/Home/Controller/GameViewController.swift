//
//  GameViewController.swift
//  CM
//
//  Created by aZu on 2020/12/20.
//

import UIKit
import Alamofire

private let kEdgeMargin : CGFloat = 10
private let kItemW :CGFloat = (kScreenW - 2 * kEdgeMargin ) / 3
private let kItemH :CGFloat = kItemW * 6 / 5
private let kGameCellID = "kGameCellID"


class GameViewController: UIViewController {

    
    private lazy var collectionView:UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        
        layout.minimumLineSpacing = 0
        
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        
        let collectionView = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: layout)
        
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
       
        setupUI()
       
    }
    

   

}
extension GameViewController {
    private func setupUI(){
        
        view.addSubview(collectionView)
    }
    
}



extension GameViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath)
        
        cell.backgroundColor = UIColor.randomColor()
        
        return cell
        
        
        
    }
    
    
    
}
