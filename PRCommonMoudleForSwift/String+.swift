//
//  String.swift
//  Ex
//
//  Created by JingZhao_R on 2019/3/21.
//
import Foundation
import CommonCrypto

extension String {
    
    /// 是否是电话号码格式
    public func isPhoneFormat() -> Bool {
        let pattern = "^(13[0-9]|14[0-9]|15[0-9]|17[0-9]|18[0-9]|16[0-9]|19[0-9])\\d{8}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@", pattern)
        return regextestmobile.evaluate(with: self)
    }
    
    /// 是否是身份证格式
    public func isIdentityNoFormat() -> Bool {
        let pattern = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@", pattern)
        return regextestmobile.evaluate(with: self)
    }
    
    /// Md5加密
    public func md5String() ->String!{
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        return String(format: hash as String)
    }
}
