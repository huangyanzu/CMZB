//
//  RecommendCycleView.swift
//  CM
//
//  Created by aZu on 2020/12/23.
//

import UIKit

private let kCyclCellID = "kCyclCellID"

class RecommendCycleView: UIView {
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = []
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCyclCellID)
       
        
        
    }

    override func layoutSubviews() {
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false 
        
    }
    
    
}

extension RecommendCycleView{
    
    class func recommendCycleView()->RecommendCycleView{
        
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
        
    }
    
}

extension RecommendCycleView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCyclCellID, for: indexPath)
        
        cell.backgroundColor = (indexPath.item % 2 == 0 ) ? UIColor.red : UIColor.black
        
        return cell 
        
        
    }
    
    
   
    
}
