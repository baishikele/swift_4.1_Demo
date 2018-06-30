//
//  HomeTableViewController.swift
//  swiftDemo
//
//  Created by 唐欢 on 2018/6/27.
//  Copyright © 2018年 唐欢. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    lazy var titleBtn: TitleBtn = TitleBtn()

    lazy var animationObj : PopoverAnimationView = PopoverAnimationView {[weak self] (prensented)->() in
        self?.titleBtn.isSelected = prensented
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vistorView.beginAnimation()
        
        setupHomeUIs()
    }

}

// MARK-UI处理
extension HomeTableViewController{
    
     func setupHomeUIs() {
    
        if !isLogin {
            return
        }else{
            navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
            navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
            titleBtn.addTarget(self, action: #selector(titleClick(_:)), for: .touchUpInside)
            titleBtn.setTitle("唐欢", for: .normal)
            navigationItem.titleView = titleBtn
            
            
        }
    }
}

// MARK-事件处理
extension HomeTableViewController{
    
   @objc func titleClick(_ btn: TitleBtn) -> () {
        
        btn.isSelected = !btn.isSelected
    
        let popover = UIPopoverViewController()
    
        // 这个枚举可以使下面的视图控制器始终都在
        popover.modalPresentationStyle = .custom
        // 转场动画
        popover.transitioningDelegate = animationObj
        animationObj.popoverFrame = CGRect(x: (view?.frame.size.width)!/2-100, y: 55, width: 200, height: 300)
    animationObj.callBack = {
        (prensented: Bool)->() in
        print("这里也可以看回调哦")
        print(prensented)
    }
        present(popover, animated: true) {
            
        }
    }
}
