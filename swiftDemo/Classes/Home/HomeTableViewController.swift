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
        popover.transitioningDelegate = self
        present(popover, animated: true) {
            
        }
    }
}

// MARK-代理
extension HomeTableViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
       return THUIPresentationController(presentedViewController: presented, presenting: presenting)
        
    }
}
