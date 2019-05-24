//
//  View+.swift
//  Ex
//
//  Created by JingZhao_R on 2019/1/19.
//

import SnapKit

extension UIView {
    
    /// 浅灰色
    open class var keyWindow: UIWindow {
        return UIApplication.shared.keyWindow!
    }
    
    
    /// 添加边框
    public func addBorder(width: CGFloat = 0,
                          color: UIColor = .separator) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    /// 添加底部边框
    @discardableResult
    public func addBottomBorder(left: CGFloat = 0,
                                right: CGFloat = 0,
                                height: CGFloat = UIAdapter.OnePixels,
                                color: UIColor = .separator) -> UIView {
        let line = UIView()
        addSubview(line)
        line.backgroundColor = color
        line.snp.makeConstraints { (make) in
            make.left.equalTo(left)
            make.right.equalTo(right)
            make.height.equalTo(height)
            make.bottom.equalToSuperview()
        }
        return line
    }
    
    /// 添加顶部边框
    @discardableResult
    public func addTopBorder(left: CGFloat = 0,
                             right: CGFloat = 0,
                             height: CGFloat = UIAdapter.OnePixels,
                             color: UIColor = .separator) -> UIView {
        let line = UIView()
        addSubview(line)
        line.backgroundColor = color
        line.snp.makeConstraints { (make) in
            make.left.equalTo(left)
            make.right.equalTo(right)
            make.height.equalTo(height)
            make.top.equalToSuperview()
        }
        return line
    }
    
    /// 添加左边边框
    public func addLeftBorder(top: CGFloat = 0, bottom: CGFloat = 0, width: CGFloat = UIAdapter.OnePixels, color: UIColor = .separator) {
        let line = UIView()
        addSubview(line)
        line.backgroundColor = color
        line.snp.makeConstraints { (make) in
            make.top.equalTo(top)
            make.bottom.equalTo(bottom)
            make.width.equalTo(width)
            make.left.equalToSuperview()
        }
    }
    
    /// 添加右边边框
    public func addRightBorder(top: CGFloat = 0, bottom: CGFloat = 0, width: CGFloat = UIAdapter.OnePixels, color: UIColor = .separator) {
        let line = UIView()
        addSubview(line)
        line.backgroundColor = color
        line.snp.makeConstraints { (make) in
            make.top.equalTo(top)
            make.bottom.equalTo(bottom)
            make.width.equalTo(width)
            make.right.equalToSuperview()
        }
    }
    
    /// 添加指定圆角
    ///
    /// - Parameters:
    ///   - corners: 指定角
    ///   - redius: 圆角大小
    public func addRadius(corners: UIRectCorner, redius: CGSize, color: UIColor) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: redius)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        maskLayer.fillColor = color.cgColor
        self.layer.mask = maskLayer
    }
    
    
}

