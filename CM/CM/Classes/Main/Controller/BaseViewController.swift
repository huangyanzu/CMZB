//
//  BaseViewController.swift
//  CM
//
//  Created by aZu on 2020/12/27.
//

import UIKit

class BaseViewController: UIViewController {
    
    var contentView : UIView?

    lazy var animImageView:UIImageView = {[weak self] in
        
        let imageView = UIImageView(image: UIImage(named: "img_loading_1"))
        imageView.center = (self?.view.center)!
        
        imageView.animationImages = [UIImage(named: "img_loading_1")!,UIImage(named: "img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin,.flexibleBottomMargin]
        
        return imageView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    

}

extension BaseViewController{
    
   @objc func setupUI(){
     
       contentView?.isHidden = true
    
       view.addSubview(animImageView)
    
       animImageView.startAnimating()
        
    }
    
    func loadDataFinished(){
        
        animImageView.stopAnimating()
        
        animImageView.isHidden = true
        
        contentView?.isHidden = false 
        
        
    }
    
}
