//
//  noLoginView.swift
//  swiftDemo
//
//  Created by 唐欢 on 2018/6/29.
//  Copyright © 2018年 唐欢. All rights reserved.
//

import UIKit

class noLoginView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    class func noLoginView()->noLoginView {
       return Bundle.main.loadNibNamed("noLoginView", owner: nil, options: nil)?.last as! noLoginView
        
    }
}
