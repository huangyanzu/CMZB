//
//  CollectionHeaderView.swift
//  CM
//
//  Created by aZu on 2020/12/18.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var moreBtn: UIButton!
    
    var group : AnchorGroup?{
        didSet{
            titleLabel.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
            
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        
        
        
    }
    
}

extension CollectionHeaderView{
    
    class func collectionHeaderView()->CollectionHeaderView {
        return Bundle.main.loadNibNamed("CollectionHeaderView", owner: nil, options: nil)?.first as! CollectionHeaderView
    }
    
}
