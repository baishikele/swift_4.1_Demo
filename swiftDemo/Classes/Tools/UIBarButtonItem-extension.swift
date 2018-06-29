//
//  UIBarButtonItem-extension.swift
//  swiftDemo
//
//  Created by 唐欢 on 2018/6/29.
//  Copyright © 2018年 唐欢. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    convenience init(imageName: String) {
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName+"_highlighted"), for: .highlighted)

        self.init(customView: btn)
    }
}
