//
//  HomeViewController.swift
//  CM
//
//  Created by aZu on 2020/12/14.
//

import UIKit

private let kTitleViewH :CGFloat = 40

class HomeViewController: UIViewController {

    private lazy var pageTitleView:PageTitleView = {
        
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        
        let titles = ["推荐","游戏","娱乐","趣玩"]
        
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        
       // titleView.backgroundColor = UIColor.red 
        
        return titleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        
        
    }
    

   

}

//MARK:设置界面
extension HomeViewController{
    
   private func setupUI(){
    
   // automaticallyAdjustsScrollViewInsets = false
    
    
        
     setupNavigationBar()
     
    view.addSubview(pageTitleView)
     
    
    
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
