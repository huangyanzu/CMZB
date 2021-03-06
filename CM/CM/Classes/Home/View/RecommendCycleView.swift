//
//  RecommendCycleView.swift
//  CM
//
//  Created by aZu on 2020/12/23.
//

import UIKit

private let kCyclCellID = "kCyclCellID"

class RecommendCycleView: UIView {
    
    var cycleTimer : Timer?
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cycleModels:[CycleModel]?{
        didSet{
            collectionView.reloadData()
            
            pageControl.numberOfPages = cycleModels?.count ?? 0
            
           
            removeCycleTimer()
            
            addCycleTimer()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = []
        
        collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCyclCellID)
       
       
        
        
    }

    override func layoutSubviews() {
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = collectionView.bounds.size
        
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        let indexPath = IndexPath(item: (cycleModels?.count ?? 0) * 100, section: 0)
        
        collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
        
    }
    
    
}

extension RecommendCycleView{
    
    class func recommendCycleView()->RecommendCycleView{
        
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
        
    }
    
}

extension RecommendCycleView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (cycleModels?.count ?? 0) * 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCyclCellID, for: indexPath) as! CollectionCycleCell
        
        let cycleModel = cycleModels![indexPath.item % cycleModels!.count]
        
        cell.cycleModel = cycleModel
        
        return cell 
        
        
    }
    
    
   
    
}
extension RecommendCycleView : UICollectionViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5 
        
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width ) % (cycleModels?.count ?? 1)
        
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
     
        removeCycleTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        addCycleTimer()
    }
    
    
}

extension RecommendCycleView {

    private func addCycleTimer(){
        
         cycleTimer = Timer(timeInterval: 4.0, target: self, selector: #selector(scrollToNext), userInfo: nil, repeats: true)
        
        guard let cTimer = cycleTimer else{ return }
        
        RunLoop.main.add(cTimer, forMode: .common)
        
    }
    
    private func removeCycleTimer(){
        cycleTimer?.invalidate()
        cycleTimer = nil
        
    }


    @objc private func scrollToNext(){
        
        let currentOffsetX = collectionView.contentOffset.x
        
        let offSetX = currentOffsetX + collectionView.bounds.width
        
        collectionView.setContentOffset(CGPoint(x: offSetX, y: 0), animated: true)
        
    }
    
}
