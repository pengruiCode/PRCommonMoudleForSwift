//
//  UIAdapter.swift
//  UIAdapter
//
//  Created by chaopeng_coder on 2019/1/18.
//

import UIKit

public struct UIAdapter {
    /// 1像素
    public static let OnePixels = 1 / Screen.Scale
    
    /// 底部Tabbar高度
    public static let TabBarHeight: CGFloat = 49
    /// 状态栏高度
    public static let StatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    /// 导航条高度 + 状态栏高度
    public static let NavigationBarHeight: CGFloat = StatusBarHeight + 44
    
    public struct Screen {
        /// 屏幕比例
        public static let Scale = UIScreen.main.scale
        /// 屏幕比例
        public static let Ratio: CGFloat = 1080 / Width
        /// 屏幕宽度
        public static let Width = UIScreen.main.bounds.size.width
        /// 屏幕高度
        public static let Height = UIScreen.main.bounds.size.height
    }
}
