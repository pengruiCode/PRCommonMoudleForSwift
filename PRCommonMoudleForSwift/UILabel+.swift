//
//  UILabel+.swift
//  Ex
//
//  Created by JingZhao_R on 2019/4/24.
//

import Foundation
import UIKit

extension UILabel {
    /// 整数递增显示
    ///
    /// - Parameter text: 整数文本
    public func textIncrement(_ text: String) {
        guard let intText = Int(text) else { return }
        var numText: Int = 0
        let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        timer.schedule(wallDeadline: .now(), repeating: 0.0005)
        timer.setEventHandler {
            if numText != intText {
                numText += 1
                DispatchQueue.main.async(execute: { [weak self] in
                    guard let `self` = self else { return }
                    self.text = "\(numText)"
                })
            } else {
                timer.cancel()
            }
        }
        timer.resume()
    }
}
