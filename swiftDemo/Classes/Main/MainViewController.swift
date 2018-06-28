//
//  MainViewController.swift
//  swiftDemo
//
//  Created by 唐欢 on 2018/6/27.
//  Copyright © 2018年 唐欢. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//  大旗面试题
//        var total = 0
//        let arr = [[1,2,3],[1,2,3],[1,2,3]]
//
//        for i in 0..<arr.count{
//
//            let sub = arr[i];
//
//            for j in 0..<sub.count{
//
//                let a = sub[j]
//                total += a
//            }
//        }
//        print(total)

        addChildViewControllers()
    }
    
    func addChildViewControllers(){
        
        
        
        guard let path = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil) else {
            print("路径不存在")
            return
        }
        
        guard let data = NSData(contentsOfFile: path) else{
            
            print("加载二进制出错")
            return
        }
        
        do {
            let objc = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String: String]]
            
            for dict in objc {
                let name = dict["vcName"]
                let title = dict["title"]
                let imageName = dict["imageName"]

                addChildViewController(name, title: title, imageName: imageName)
            }
        } catch  {
            //1.创建子控制器
            addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
            
            addChildViewController("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
            
            addChildViewController("DiscoverTableViewController", title: "发现", imageName: "tabbar_discover")
            
            addChildViewController("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
        }
        
        
      
        
        tabBar.tintColor = UIColor.orange
        
    }
    
    // 方法重载
    func addChildViewController(_ vc: String?, title: String?, imageName: String?) {
      
        guard let name = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else{
            
            return
        }
        
        var cls: AnyClass? = nil
        if let vcName = vc {
           cls = NSClassFromString(name+"."+vcName)
        }
        

        
        guard let typeCls = cls as? UITableViewController.Type else{
            
            return
        }
        
        //2.设置子控制器属性
            let chiledVc = typeCls.init()
            chiledVc.tabBarItem.title = title
        
            if let imageName = imageName {
                chiledVc.tabBarItem.image = UIImage(named: imageName)
                chiledVc.tabBarItem.selectedImage = UIImage(named: imageName+"_highlighted")
            }
        
        
            let nav = UINavigationController(rootViewController: chiledVc)
            chiledVc.navigationItem.title = title
            //3.添加到自控制器
            addChildViewController(nav)
        
          
        
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
