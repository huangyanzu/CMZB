//
//  CollectionPrettyCell.swift
//  CM
//
//  Created by aZu on 2020/12/18.
//

import UIKit
import SDWebImage

class CollectionPrettyCell: CollectionBaseCell {

    
    @IBOutlet weak var cityBtn: UIButton!
    
    
   
    
    override var anchor :AnchorModel?{
        didSet{
            
            super.anchor = anchor
            
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
            
        }
    }
    
    

}
