//
//  AmuseMenuViewCell.swift
//  CM
//
//  Created by aZu on 2020/12/26.
//

import UIKit

private let kGameCellID = "kGameCellID"

class AmuseMenuViewCell: UICollectionViewCell {
    
    
    var groups: [AnchorGroup]?{
        didSet{
            collectionView.reloadData()
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
       
      
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        let itemW = collectionView.bounds.width / 4
        
        let itemH = collectionView.bounds.height / 2
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0 
        
        layout.itemSize = CGSize(width: itemW, height: itemH)
        
        
        
    }
    
    

}
extension AmuseMenuViewCell :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        
        cell.group = groups![indexPath.item]
        
        cell.clipsToBounds = true 
        
        return cell
        
        
    }
    
    
    
    
}
