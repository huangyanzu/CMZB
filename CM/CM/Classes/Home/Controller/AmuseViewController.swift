//
//  AmuseViewController.swift
//  CM
//
//  Created by aZu on 2020/12/25.
//

import UIKit

private let kItemMargin :CGFloat = 10

private let kItemW = (kScreenW - 3 * kItemMargin) / 2
private let kNormalItemH = kItemW * 3 / 4
private let kPrettyItemH = kItemW * 4 / 3

private let kHeaderViewH :CGFloat = 50

private let kHeaderViewID = "kHeaderViewID"


private let kNornalCellID = "kNornalCellID"
private let kPrettyCellID = "kPrettyCellID"


class AmuseViewController: UIViewController {
    
    
    private lazy var amuseVM :AmuseViewModel = AmuseViewModel()
    
    
    private lazy var collectionView :UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        let collectionView = UICollectionView(frame: (self?.view.bounds)! , collectionViewLayout: layout)
        
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        collectionView.backgroundColor = UIColor.white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
       
        
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNornalCellID)
        
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        
        
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        setupUI()
        loadData()
        
    }
    

  

}
extension AmuseViewController{
    
    private func setupUI(){
        
        view.addSubview(collectionView)
        
    }
    
}

extension AmuseViewController{
    private func loadData(){
        
        amuseVM.loadAmuseData {
            
            self.collectionView.reloadData()
        }
        
    }
    
    
}


extension AmuseViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return amuseVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return amuseVM.anchorGroups[section].room_list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNornalCellID, for: indexPath ) as! CollectionNormalCell
        
        cell.anchor = amuseVM.anchorGroups[indexPath.section].room_list?[indexPath.item]
      
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        
        
        headerView.group = amuseVM.anchorGroups[indexPath.section]
        
        return headerView 
        
    }
    
    
    
}
