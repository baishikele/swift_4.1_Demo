//
//  BaseTableViewController.swift
//  swiftDemo
//
//  Created by 唐欢 on 2018/6/29.
//  Copyright © 2018年 唐欢. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    var isLogin = true
    var vistorView = noLoginView.noLoginView()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUIs()
    }

}

extension BaseTableViewController {
    
    override func loadView() {
        
        isLogin == false ? createNoLoginView() : super.loadView()
    }
    
    func createNoLoginView() -> () {
        view = vistorView
    }
    
    func setupUIs() -> () {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(registClick(_:)))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(loginClick(_:)))
        
        vistorView.registerBtn.addTarget(self, action: #selector(registClick(_:)), for: .touchUpInside)
        vistorView.loginBtn.addTarget(self, action: #selector(loginClick(_:)), for: .touchUpInside)

    }

    @objc func registClick(_ btn: UIBarButtonItem) -> () {
        print("点击注册")
    }
    
    @objc func loginClick(_ btn: UIBarButtonItem) -> () {
        print("点击登录")
    }
}
