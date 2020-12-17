//
//  HomeViewController.swift
//  CM
//
//  Created by aZu on 2020/12/14.
//

import UIKit

private let kTitleViewH :CGFloat = 40

class HomeViewController: UIViewController {

    private lazy var pageTitleView:PageTitleView = { [weak self] in
        
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        
        let titles = ["推荐","游戏","娱乐","趣玩"]
        
        let titleView = PageTitleView(frame: titleFrame, titles: titles)

        titleView.delegate = self
        
       // titleView.backgroundColor = UIColor.red 
        
        return titleView
    }()
    
    private lazy var pageContentView:PageComtentView = { [weak self] in

        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH

        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)

        var childVCs = [UIViewController]()

        for _ in 0..<4{
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)) )
            
            childVCs.append(vc)
            
        }


        let contentView = PageComtentView(frame: contentFrame, childVcs: childVCs, parentViewController: self)

        return contentView

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
     
    view.addSubview(pageContentView)
    
    pageContentView.backgroundColor = UIColor.red 
    
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

extension HomeViewController : PageTitleViewDelegate{
    
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
    
}
