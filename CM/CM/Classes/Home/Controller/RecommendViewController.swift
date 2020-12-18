//
//  RecommendViewController.swift
//  CM
//
//  Created by aZu on 2020/12/18.
//

import UIKit

private let kItemMargin :CGFloat = 10
private let kItemW = (kScreenW - 3 * kItemMargin) / 2
private let kItemH = kItemW * 3 / 4
private let kHeaderViewH :CGFloat = 50
private let kHeaderViewID = "kHeaderViewID"


private let kNornalCellID = "kNornalCellID"

class RecommendViewController: UIViewController {
    
    private lazy var collectionView :UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0 
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        let collectionView = UICollectionView(frame: (self?.view.bounds)! , collectionViewLayout: layout)
        
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        collectionView.backgroundColor = UIColor.white
        
        collectionView.dataSource = self
        
       
        
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNornalCellID)
        
        
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
       
    }
    

}

extension RecommendViewController{
    
    private func setupUI(){
       
        view.addSubview(collectionView)
        
    }
    
    
}

extension RecommendViewController:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNornalCellID, for: indexPath)
        
      
        
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        
       
        
        return headerView
        
    }
    
}
