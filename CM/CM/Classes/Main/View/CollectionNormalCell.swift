//
//  CollectionNormalCell.swift
//  CM
//
//  Created by aZu on 2020/12/18.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {
    
   @IBOutlet weak var roomNameLabel: UILabel!
    
  
    
   override var anchor :AnchorModel?{
       didSet{
            super.anchor = anchor
            roomNameLabel.text = anchor?.room_name
            
        }
        
        
    }
}
