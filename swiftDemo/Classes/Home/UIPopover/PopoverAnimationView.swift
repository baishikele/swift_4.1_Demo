//
//  PopoverAnimationView.swift
//  swiftDemo
//
//  Created by 唐欢 on 2018/6/30.
//  Copyright © 2018年 唐欢. All rights reserved.
//

import UIKit

class PopoverAnimationView: NSObject {
    
    
    lazy var popoverFrame : CGRect = CGRect.zero

    lazy var isPresented: Bool = false

    var callBack: ((_ presented: Bool)->())?
    
    init(callBack:@escaping (_ presented: Bool)->()){
        self.callBack = callBack
    }
}


// MARK-代理
extension PopoverAnimationView: UIViewControllerTransitioningDelegate {
    
    // 目的：设置弹出视图frame
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
       let vc = THUIPresentationController(presentedViewController: presented, presenting: presenting)
        vc.popoverFrame = popoverFrame 
        return vc
        
    }
    
    // 目的：设置[弹出]视图动画，调用这个函数，就是自定义动画，系统不会帮助完成动画，需要自己完成
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {// 返回的是一个遵循协议的对象，即返回self，self遵循协议
        return self// self要遵循代理
    }
    
    // 目的，设置[消失动画]
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}


// MARK-设置代理
extension PopoverAnimationView: UIViewControllerAnimatedTransitioning {
    
    // 动画时间
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.5
    }
    
    // 添加动画
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        if isPresented == false {
            isPresented = true
            presentTransition(transitionContext: transitionContext)
        }else{
            isPresented = false
            disssTransiton(transitionContext: transitionContext)
        }
        
        callBack!(isPresented)
    }
    
    func presentTransition(transitionContext: UIViewControllerContextTransitioning) -> () {
        // 1、获取动画view
        //UITransitionContextFromViewKey
        //UITransitionContextToViewKey
        //let presentView = transitionContext.viewForKey(UITransitionContextToViewKey)  这个是swift2的写法
        guard let presentView = transitionContext.view(forKey: UITransitionContextViewKey.to) else{
            
            return
        }
        
        
        // 2.添加视图
        transitionContext.containerView.addSubview(presentView)
        presentView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        // 3.执行动画
        presentView.layer.transform = CATransform3DMakeScale(1, 0, 1)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentView.layer.transform = CATransform3DIdentity
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
    
    func disssTransiton(transitionContext: UIViewControllerContextTransitioning) -> () {
        // 1、获取动画view
        //UITransitionContextFromViewKey
        //UITransitionContextToViewKey
        //let presentView = transitionContext.viewForKey(UITransitionContextToViewKey)  这个是swift2的写法
        guard let presentView = transitionContext.view(forKey: UITransitionContextViewKey.from) else{
            
            return
        }
        
        // 2.执行动画
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            
            presentView.layer.transform = CATransform3DMakeScale(1, 0.0001, 1)
            
        }) { (_) in
            presentView.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
}
