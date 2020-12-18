//
//  PageComtentView.swift
//  CM
//
//  Created by aZu on 2020/12/15.
//

import UIKit

protocol PageComtentViewDelegate : class {
    
    func pageComtentView(contentView:PageComtentView,progress:CGFloat ,sourceIndex:Int,targetIndex:Int)
}

private let contentCellId = "contentCellId"


class PageComtentView: UIView {

    private var  childVcs:[UIViewController]
    
    private  weak var parentViewController:UIViewController?
    
    weak var delegate : PageComtentViewDelegate?
    private var isForbidScrollDelegate : Bool = false
    
    private lazy var collectionView:UICollectionView = { [weak self ] in
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero,collectionViewLayout: layout)
        
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.isPagingEnabled = true
        
        collectionView.bounces = false
        
        collectionView.dataSource = self
        
        collectionView.delegate = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCellId)
        
        return collectionView
        
    }()
    
    
    private var startOffsetX:CGFloat = 0
    
    init(frame:CGRect,childVcs:[UIViewController],parentViewController:UIViewController?){
        
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}

extension PageComtentView{
    
    private func setupUI(){
        
        
        for childVc in childVcs {
            
            parentViewController?.addChild(childVc)
            
            
        }
        
        
        addSubview(collectionView)
        
        collectionView.frame = bounds
    }
    
}

extension PageComtentView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellId, for: indexPath)
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let childVc = childVcs[indexPath.row]
        
        
        
        childVc.view.frame = cell.contentView.bounds
        
        cell.contentView.addSubview(childVc.view)
        
        return cell
        
    }
    

}

extension PageComtentView:UICollectionViewDelegate{
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        isForbidScrollDelegate = false
        
       startOffsetX = scrollView.contentOffset.x
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if isForbidScrollDelegate {return}
        
        var progress : CGFloat = 0
        
        var sourceIndex :Int = 0
        
        var targetIndex :Int = 0
        
        let currentOffsetX = scrollView.contentOffset.x
        
        let scrollViewW = scrollView.bounds.width
        
        if currentOffsetX > startOffsetX {//左滑
            
            progress = currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW)
            
            sourceIndex = Int(currentOffsetX / scrollViewW)
            
            targetIndex = sourceIndex + 1
            if targetIndex >= childVcs.count - 1 {
                targetIndex = childVcs.count - 1
            }
            
            if currentOffsetX - startOffsetX == scrollViewW{
                progress = 1
                targetIndex = sourceIndex
            }
            
        }else{//右滑
            
            progress = 1 - (currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW))
            
            targetIndex = Int(currentOffsetX / scrollViewW)
            
            sourceIndex = targetIndex + 1
            
            if sourceIndex >= childVcs.count{
                sourceIndex = childVcs.count - 1
            }
            
        }
        
       
        delegate?.pageComtentView(contentView: self, progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
        
    }
    
    
    
    
}




extension PageComtentView {
    
    
    
    func setCurrentIndex(currentIndex : Int) {
        
        isForbidScrollDelegate = true
        
        let offsetX = CGFloat(currentIndex) * collectionView.frame.width
        
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
        
        
        
        
        
    }
}
