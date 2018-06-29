//
//  HomeTableViewController.swift
//  swiftDemo
//
//  Created by 唐欢 on 2018/6/27.
//  Copyright © 2018年 唐欢. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    var titleBtn: TitleBtn = TitleBtn()
    
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

            titleBtn.setTitle("唐欢", for: .normal)
            navigationItem.titleView = titleBtn
            
            
        }
    }
}
