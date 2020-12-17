//
//  PageComtentView.swift
//  CM
//
//  Created by aZu on 2020/12/15.
//

import UIKit

private let contentCellId = "contentCellId"

class PageComtentView: UIView {

    private var  childVcs:[UIViewController]
    
    private  weak var parentViewController:UIViewController?
    
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
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentCellId)
        
        return collectionView
        
    }()
    
    
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

extension PageComtentView {
    func setCurrentIndex(currentIndex : Int) {
        
        let offsetX = CGFloat(currentIndex) * collectionView.frame.width
        
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
        
        
        
    }
}
