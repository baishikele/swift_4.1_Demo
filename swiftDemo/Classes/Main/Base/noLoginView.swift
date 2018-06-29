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
    @IBOutlet weak var animationView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tips: UILabel!
    
    class func noLoginView()->noLoginView {
       return Bundle.main.loadNibNamed("noLoginView", owner: nil, options: nil)?.last as! noLoginView
        
    }
    //visitordiscover_image_message
    func setUpVistorView(icon:String, tps:String) -> () {
        iconView.image = UIImage(named: icon)
        tips.text = tps
        animationView.isHidden = true
    }
    
    func beginAnimation() -> () {
        let ani =  CABasicAnimation(keyPath: "transform.rotation.z")
        
        ani.fromValue = 0
        ani.toValue = M_PI*2
        ani.repeatCount = MAXFLOAT
        ani.duration = 5
        ani.isRemovedOnCompletion = true
        animationView.layer.add(ani, forKey: nil)
    }
}
