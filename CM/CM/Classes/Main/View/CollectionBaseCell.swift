//
//  CollectionBaseCell.swift
//  CM
//
//  Created by aZu on 2020/12/23.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var onlineBtn: UIButton!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    var anchor :AnchorModel?{
        didSet{
           
            guard let anchor = anchor  else {
                return
            }
            
            var  onlineStr : String = ""
            
            if anchor.online >= 10000{
                
                onlineStr = "\(Int(anchor.online / 10000))万在线"
                
            }else{
                onlineStr = "\(Int(anchor.online / 10000))在线"
            }
            
            onlineBtn.setTitle(onlineStr, for: .normal)
            
            nickNameLabel.text = anchor.nickname
            
           
            
            guard let url = anchor.vertical_src,
                  let iconURL = URL(string: url) else {
                iconImageView.image = UIImage(named: "live_cell_default_phone")
                
                //imageView.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
                return
            }
            
            iconImageView.sd_setImage(with: iconURL, placeholderImage: UIImage(named: "live_cell_default_phone"))
            
        }
    }
    
}
