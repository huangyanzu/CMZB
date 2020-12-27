//
//  RecommendViewController.swift
//  CM
//
//  Created by aZu on 2020/12/18.
//

import UIKit

private let kItemMargin :CGFloat = 10

private let kItemW = (kScreenW - 3 * kItemMargin) / 2
private let kNormalItemH = kItemW * 3 / 4
private let kPrettyItemH = kItemW * 4 / 3

private let kCycleViewH = kScreenW * 3 / 8

private let kGameViewH : CGFloat = 90


private let kHeaderViewH :CGFloat = 50
private let kHeaderViewID = "kHeaderViewID"


private let kNornalCellID = "kNornalCellID"
private let kPrettyCellID = "kPrettyCellID"



class RecommendViewController: BaseAnchorViewController {
    
   
    
    private lazy var recommentVM  : RecommendViewModel = RecommendViewModel()
    

    private lazy var cycleView:RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        
        cycleView.frame = CGRect(x: 0, y: -kCycleViewH - kGameViewH, width: kScreenW , height: kCycleViewH)
        
        return cycleView
    }()
    
    private lazy var gameView :RecommendGameView = {
        
        let gameView = RecommendGameView.recommendGameView()
        
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        
        
        return gameView
        
    }()
    
}

extension RecommendViewController{
    
    override func loadData(){
        
        baseVM = recommentVM
        
        
        recommentVM.requestData {
            
            self.collectionView.reloadData()
            
            self.gameView.groups = self.recommentVM.anchorGroups
            
            self.loadDataFinished()
            
        }
            
            
        recommentVM.requestCycleData {
          
            self.cycleView.cycleModels = self.recommentVM.cycleModels
            
        }
        
        
            
        }
        
    
}



extension RecommendViewController{
    
    override func setupUI(){
       
        super.setupUI()
        
        collectionView.addSubview(cycleView)
        
        collectionView.addSubview(gameView)
        
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH , left: 0, bottom: 0, right: 0)
        
    }
    
    
}

extension RecommendViewController{
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let group = recommentVM.anchorGroups[indexPath.section]
        
        let anchor = group.room_list?[indexPath.item]
        
        var cell : CollectionBaseCell!
        
        if indexPath.section == 1 {
            
           cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            
        }else{
            
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNornalCellID, for: indexPath) as! CollectionNormalCell
            
        }
        
        cell.anchor = anchor
        
        
        return cell
        
        
       
    }
    
    
    
    
    
}

extension RecommendViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            return CGSize(width: kItemW , height: kPrettyItemH)
        }
        
        return CGSize(width: kItemW, height: kNormalItemH)
        
    }
    
}
