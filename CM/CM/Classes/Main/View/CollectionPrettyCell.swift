//
//  CollectionPrettyCell.swift
//  CM
//
//  Created by aZu on 2020/12/18.
//

import UIKit

class CollectionPrettyCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var onlineBtn: UIButton!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var cityBtn: UIButton!
    
    
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
            
            cityBtn.setTitle(anchor.anchor_city, for: .normal)
            
            
            
            
            
        }
    }
    
    

}
