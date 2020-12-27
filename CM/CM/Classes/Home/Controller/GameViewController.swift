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
private let kHeaderViewID = "kHeaderViewID"


private let kHeaderViewH :CGFloat = 50
private let kGameViewH :CGFloat = 90




class GameViewController: BaseViewController {

   //private lazy var gameVm: GameViewModel = GameViewModel()
    private lazy var recommentVM  : RecommendViewModel = RecommendViewModel()
    
    private lazy var topHeaderView:CollectionHeaderView = {
        
        let headerView = CollectionHeaderView.collectionHeaderView()
        headerView.frame = CGRect(x: 0, y: -kHeaderViewH - kGameViewH, width: kScreenW, height: kHeaderViewH)
        
        headerView.iconImageView.image = UIImage(named: "Img_orange")
        headerView.titleLabel.text = "常用"
        headerView.moreBtn.isHidden = true
        return headerView
        
    }()
    
    private lazy var gameView:RecommendGameView = {
        
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
        
    }()
    
    
    private lazy var collectionView:UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        
        layout.minimumLineSpacing = 0
        
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        
        
        let collectionView = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: layout)
        
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind:  UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.white 
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
       
        setupUI()
        loadData()
       
    }
    

   

}
extension GameViewController {
    override func setupUI(){
        
        contentView = collectionView 
        
        view.addSubview(collectionView)
        
        collectionView.addSubview(topHeaderView)
        
        collectionView.addSubview(gameView)
        
        collectionView.contentInset = UIEdgeInsets(top: kHeaderViewH + kGameViewH , left: 0, bottom: 0, right: 0)
      
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        super.setupUI()
    }
    
}

extension GameViewController{
    
    private  func loadData(){
        
        recommentVM.requestData {
            
            self.collectionView.reloadData()
            
           self.gameView.groups = Array(self.recommentVM.anchorGroups[0..<6])
            
            self.loadDataFinished()
            
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        
        headerView.titleLabel.text = "全部"
        
        headerView.iconImageView.image = UIImage(named: "Img_orange")
        
        headerView.moreBtn.isHidden = true
        
        return headerView
    }
    
}
