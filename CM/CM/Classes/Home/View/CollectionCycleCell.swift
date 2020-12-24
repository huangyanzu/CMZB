//
//  CollectionCycleCell.swift
//  CM
//
//  Created by aZu on 2020/12/23.
//

import UIKit

class CollectionCycleCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
  
    
    @IBOutlet weak var bgView: UIView!
    
    
    var cycleModel:CycleModel?{
        didSet{
            
            titleLabel.text = cycleModel?.title
            
            let iconURL = URL(string: cycleModel?.pic_url ?? "")
            
            iconImageView.sd_setImage(with: iconURL)
            
            iconImageView.layer.cornerRadius = 5
            iconImageView.layer.masksToBounds = true 
            
            bgView.isHidden = true 
        }
    }
    
    
}
