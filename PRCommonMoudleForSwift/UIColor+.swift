//
//  UIColor+.swift
//  PRCommonMoudleForSwift
//
//  Created by 彭睿 on 2019/5/22.
//  Copyright © 2019 彭睿. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

extension UIColor {
    
    /// 背景灰色
    open class var background: UIColor {
        return UIColor("#EDEDED")
    }
    
    /// 分割线色
    open class var separator: UIColor {
        return UIColor("")
    }
    
    /// 导航条阴影颜色
    open class var barShadowColor: UIColor {
        return UIColor("#A6A6A6")
    }
    
    /// 遮盖颜色
    open class var cover: UIColor {
        return UIColor("#33333366")
    }
    
    /// 深灰色
    open class var darkgray_: UIColor {
        return UIColor("#333333")
    }
    
    /// 中灰色
    open class var mediumgray: UIColor {
        return UIColor("#666666")
    }
    
    /// 浅灰色
    open class var lightgray_: UIColor {
        return UIColor("#999999")
    }

    /// 设置自定义颜色
    class func RGBColor(r:Double,g:Double,b:Double,alpha: Float) ->UIColor!{
        return UIColor.init(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: CGFloat(alpha))
    }
}
