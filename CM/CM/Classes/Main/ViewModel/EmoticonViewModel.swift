//
//  EmoticonViewModel.swift
//  CM
//
//  Created by aZu on 2021/1/9.
//

import UIKit

class EmoticonViewModel {

    static let shareInstance : EmoticonViewModel = EmoticonViewModel()
    lazy var packages : [EmoticonPackage] = [EmoticonPackage]()
    
    private init() {
        packages.append(EmoticonPackage(plistName: "QHNormalEmotionSort.plist"))
        packages.append(EmoticonPackage(plistName: "QHSohuGifSort.plist"))
    }
    
}
