//
//  UIButton-extenstion.swift
//  swiftDemo
//
//  Created by 唐欢 on 2018/6/29.
//  Copyright © 2018年 唐欢. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// 便利构造函数
    convenience init(image:String,highlightedImage:String, backImage:String, highlightedBackImage:String) {
        self.init()
        
        setImage(UIImage(named: image), for:.normal)
        setImage(UIImage(named: image), for:.highlighted)

        setBackgroundImage(UIImage(named: backImage), for: .normal)
        setBackgroundImage(UIImage(named: highlightedBackImage), for: .highlighted)
        
        sizeToFit()
    }
}
