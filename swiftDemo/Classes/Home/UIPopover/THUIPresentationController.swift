//
//  THUIPresentationController.swift
//  swiftDemo
//
//  Created by 唐欢 on 2018/6/30.
//  Copyright © 2018年 唐欢. All rights reserved.
//

import UIKit

class THUIPresentationController: UIPresentationController {

    
    lazy var popoverFrame : CGRect = CGRect.zero
    
    override func containerViewWillLayoutSubviews() {
        
        // 修改presentedView frame
        presentedViewController.view.frame = popoverFrame
        
        // 设置蒙版
        setupCover()
    }
}

extension THUIPresentationController {
    
    func setupCover() -> () {
        let cover = UIButton(frame: presentingViewController.view.bounds)
        cover.addTarget(self, action: #selector(coverClick(_:)), for: .touchUpInside)
        containerView?.insertSubview(cover, belowSubview: presentedViewController.view)
        
        cover.backgroundColor = UIColor(white: 0, alpha: 0.15)

    }
    
    @objc func coverClick(_ btn:UIButton){
        presentedViewController.dismiss(animated: true) {
            
        }
    }
}
