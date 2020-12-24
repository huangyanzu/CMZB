//
//  CollectionGameCell.swift
//  CM
//
//  Created by aZu on 2020/12/24.
//

import UIKit

class CollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var group:AnchorGroup?{
        didSet{
          
            titleLabel.text = group?.tag_name
            
            let iconURL = URL(string: group?.icon_url ?? "")
            
          
            
            iconImageView.sd_setImage(with: iconURL, placeholderImage: UIImage(named: "home_more_btn"))
            iconImageView.layer.cornerRadius = iconImageView.bounds.size.width * 0.5
            iconImageView.layer.masksToBounds = true 
            
        }
    }
    
  
}
