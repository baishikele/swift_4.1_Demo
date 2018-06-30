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

extension HomeTableViewController{
    
   @objc func titleClick(_ btn: TitleBtn) -> () {
        
        btn.isSelected = !btn.isSelected
        let popover = UIPopoverViewController()
        // 这个枚举可以使下面的视图控制器始终都在
        popover.modalPresentationStyle = .custom
        present(popover, animated: true) {
            
        }
    }
}
