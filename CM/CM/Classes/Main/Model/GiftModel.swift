//
//  GiftModel.swift
//  XMGTV
//
//  Created by apple on 16/11/13.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit

class GiftModel: BaseModel {
    @objc var img2 : String = "" // 图片
    @objc var coin : Int = 0 // 价格
    @objc var subject : String = "" { // 标题
        didSet {
            if subject.contains("(有声)") {
                subject = subject.replacingOccurrences(of: "(有声)", with: "")
            }
        }
    }
}
