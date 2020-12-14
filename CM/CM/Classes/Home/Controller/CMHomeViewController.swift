//
//  CMHomeViewController.swift
//  CM
//
//  Created by aZu on 2020/12/14.
//

import UIKit

class CMHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        
        
    }
    

   

}

//MARK:设置界面
extension CMHomeViewController{
    
   private func setupUI(){
        
     setupNavigationBar()
    
    }
    
    private func setupNavigationBar(){
        
        //设置左侧的按钮
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        //设置右侧的按钮
        
        let size = CGSize(width: 40, height: 40)
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highlightName: "Image_my_history_click", size: size)
            
         
        let searchItem = UIBarButtonItem(imageName: "btn_search", highlightName: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highlightName: "Image_scan_click", size: size)
        
        
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
        
        
        
    }
    
    
}
