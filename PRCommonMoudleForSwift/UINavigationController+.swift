//
//  UINavigationController+.swift
//  Ex
//
//  Created by tiger on 2018/6/6.
//

import Foundation
import UIKit

extension UINavigationController {
    
    /// 删除指定ViewController
    ///
    /// - Parameter aClass: ViewController Class
    public func removeViewController(_ aClass: AnyClass) {
        let vcs = viewControllers
        let index = vcs.index { (vc) -> Bool in
            return vc.isKind(of: aClass)
        }
        
        guard let idx = index else {
            return
        }
        
        viewControllers.remove(at: idx)
    }
    
    /// 回到指定ViewController
    ///
    /// - Parameter aClass: ViewController Class
    public func popToViewController(_ aClass: AnyClass) {
        let vcs = viewControllers
        for vc in vcs.reversed() where vc.isKind(of: aClass) {
            self.popToViewController(vc, animated: true)
            break
        }
    }

    /// 删除之前所有ViewController
    public func removeBeforeViewControllers() {
        let vcs = viewControllers
        for idx in 1..<vcs.count - 1 {
            viewControllers.remove(at: idx)
        }
    }
    
    /// 删除上一个ViewController
    public func removerPreviousViewController() {
        let vcs = viewControllers
        guard vcs.count > 1 else {
            return
        }
        
        viewControllers.remove(at: vcs.count - 2)
    }
    
    /// 设置左右导航按钮
    ///
    /// - Parameter title: 标题
    /// - Parameter attributes: 标题特殊字
    /// - Parameter theLeft: 是否是左边按钮
    /// - Parameter image: 图片
    public func setNavItem(title:String, attributes:Dictionary<NSAttributedString.Key, Any>, theLeft:Bool, image:UIImage?, handle:@escaping ()->()) {
        
        let btn = UIButton.init(setImage:"", frame: CGRect(x: 0, y: 0, width: 100, height: 44)) {
            handle()
        }
        
        if image != nil {
            btn.setImage(image, for: UIControl.State.normal)
        }
        
        if title.count > 0 {
            let attStr = NSAttributedString.init(string: title, attributes: attributes)
            btn.setAttributedTitle(attStr, for: UIControl.State.normal)
            btn.sizeToFit()
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        }
        
        if theLeft == true {
            self.viewControllers[self.viewControllers.count-1].navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: btn)
        }else{
            self.viewControllers[self.viewControllers.count-1].navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: btn)
        }
    }

}
