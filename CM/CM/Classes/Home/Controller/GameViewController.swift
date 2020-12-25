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

   //private lazy var gameVm: GameViewModel = GameViewModel()
    private lazy var recommentVM  : RecommendViewModel = RecommendViewModel()
    
    private lazy var collectionView:UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        
        layout.minimumLineSpacing = 0
        
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        
        let collectionView = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: layout)
        
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.white 
        
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
        
        loadData()

    }
    
}

extension GameViewController{
    
    private  func loadData(){
        
        recommentVM.requestData {
            
            self.collectionView.reloadData()
            
           
            
        }
            
    }
    
    
}




extension GameViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommentVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        
       
        let gameModel = recommentVM.anchorGroups[indexPath.item]
        
        cell.group = gameModel 
        
        
        return cell
        
        
        
    }
    
    
    
}
