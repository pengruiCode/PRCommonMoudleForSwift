//
//  PRSwiftCommonClass.swift
//  RainySeasonLife
//
//  Created by 彭睿 on 2019/1/17.
//  Copyright © 2019 彭睿. All rights reserved.
//

import UIKit
import Foundation
import AVKit
import AVFoundation

class PRSwiftCommonClass: NSObject {

     //MARK:-设置富文本
   class func setAttributeStringText(strFullText:String, andFullTextFont textFont:UIFont, andFullTextColor textColor:UIColor, withChangeText changeText:String, withChangeFont changFont:UIFont, withChangeColor changeColor:UIColor) -> NSAttributedString{
        
        let attributeString = NSMutableAttributedString.init(string: strFullText)
        
        //需要改变的文本
        var range = NSString.init(string: strFullText).range(of: changeText)
        attributeString.addAttributes([
            NSAttributedString.Key.font:changFont,
            NSAttributedString.Key.foregroundColor:changeColor,
            ], range: range)
        
        //不需要改变的文本
        let oldText = NSString.init(string: strFullText).replacingOccurrences(of: changeText, with: "")
        range = NSString.init(string: strFullText).range(of: oldText)
        attributeString.addAttributes([
            NSAttributedString.Key.font:textFont,
            NSAttributedString.Key.foregroundColor:textColor,
            ], range: range)
        
        return attributeString
    }
    
    
     //MARK:-是否含有Emoji表情
   class func stringContainsEmoji(string:String)->Bool{
        var returnValue = false;
        let Str = NSString(format: "%@", string);
        
        Str.enumerateSubstrings(in: NSMakeRange(0, Str.length), options: NSString.EnumerationOptions.byComposedCharacterSequences) { (substring, substringRange, enclosingRange, stop) in
            
            let subStr = NSString(format: "%@", substring!);
            let hs = subStr.character(at: 0);
            // surrogate pair
            if (0xd800 <= hs && hs <= 0xdbff) {
                if (subStr.length > 1) {
                    let ls = subStr.character(at: 1);
                    let uc = Int(((hs - 0xd800) * 0x400) + (ls - 0xdc00)) + 0x10000;
                    if (0x1d000 <= uc && uc <= 0x1f77f){
                        returnValue = true;
                    }
                }
            }
            else if (subStr.length > 1) {
                let ls = subStr.character(at: 1);
                if (ls == 0x20e3){
                    returnValue = true;
                }
            }
            else {
                // non surrogate
                if (0x2100 <= hs && hs <= 0x27ff){
                    returnValue = true;
                }
                else if (0x2B05 <= hs && hs <= 0x2b07){
                    returnValue = true;
                }
                else if (0x2934 <= hs && hs <= 0x2935){
                    returnValue = true;
                }
                else if (0x3297 <= hs && hs <= 0x3299){
                    returnValue = true;
                }
                else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50){
                    returnValue = true;
                }
            }
        };
        
        return returnValue;
    }
    
    
     //MARK:-获取文本的宽度
   class func getWidthForString(strTitle:String,txtFont:UIFont) -> CGFloat {
        var fw = CGFloat.init(0)
        
        let size = NSString.init(string: strTitle).size(withAttributes: [
            NSAttributedString.Key.font:txtFont
            ])
        fw = size.width
        
        return fw
    }
    
    
     //MARK:-字典转换为Json String
   class func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
    let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
    
    
    
     //MARK:-UISearchBar样式属性修改,设置取消按钮为中文
   class func setSearchBarCancle(searchView:UISearchBar){
        
        for item:UIView in (searchView.subviews) {
            for subview:UIView in item.subviews {
                
                //更改取消按钮
                if subview.isKind(of:UIButton.classForCoder()) {
                    let btnCancle:UIButton = subview as! UIButton
                    
                    //修改文本
                    btnCancle.setTitle("取消", for: .normal)
                    
                    //修改背景
                    btnCancle.backgroundColor = UIColor.clear
                }
            }
        }
    }
    
     //MARK:-UISearchBar样式属性修改,设置提示文本字体大小
   class func setSearchBarFont(searchView:UISearchBar,font:UIFont){
        
        for item:UIView in (searchView.subviews) {
            for subview:UIView in item.subviews {
                if subview.isKind(of: UITextField.classForCoder()) {
                    (subview as? UITextField)?.font = font
                }
            }
        }
    }
    
    
    //MARK:-本地读取json文件
   class func readJsonFileByFileName(fileName : String) -> Any? {
        
        let path    = Bundle.main.path(forResource: "\(fileName).json", ofType: nil)
        let data    = NSData(contentsOfFile: path!)
        let jsonStr = try? JSONSerialization.jsonObject(with: data! as Data, options:.allowFragments)
        return jsonStr
    }
    
    //MARK:-生成指定尺寸的纯色图片
   class func imageWithColor(color: UIColor!, size: CGSize) -> UIImage{
        var size = size
        if size.equalTo(CGSize(width: 0, height: 0)){
            size = CGSize(width: 1, height: 1)
        }
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        (UIGraphicsGetCurrentContext as! CGContext).setFillColor(color.cgColor)
        (UIGraphicsGetCurrentContext as! CGContext).fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    //MARK:-快速设置view的圆角和边框
   class func viewSetBorderRadius(view: UIView!,radius:CGFloat!,borderWidth: CGFloat!,color: CGColor!) {
        view.layer.cornerRadius = radius
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = color
        view.layer.masksToBounds = true
    }
    
    //MARK:-设置原生tableviewcell的imageview的大小
    class func setTableViewCellImageViewSize(cell:UITableViewCell!,size:CGSize!){
        UIGraphicsBeginImageContext(CGSize.init(width: size.width, height: size.height))
        let imageRect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        cell.imageView?.image?.draw(in: imageRect)
        cell.imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    //MARK:-判断字符串是否是手机号
    class func isPhoneNumber(num:NSString) -> Bool
    {
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluate(with: num) == true)
            || (regextestcm.evaluate(with: num)  == true)
            || (regextestct.evaluate(with: num) == true)
            || (regextestcu.evaluate(with: num) == true))
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    
   public let DEF_ShowSystemNetworkActivityIndicator = UIApplication.shared.isNetworkActivityIndicatorVisible
    let kScreenWidth = UIScreen.main.bounds.size.width
    
    //MARK:-显示网络标识符
    class func DEF_ShowSystemNetworkActivityIndicator() ->(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    //MARK:-隐藏网络标识符
    class func DEF_HidenSystemNetworkActivityIndicator() ->(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    //MARK:-提示文字
    class func DEF_Toast(str:String) ->(){
        let style = CSToastStyle.init(defaultStyle: ())
        UIApplication.shared.keyWindow!.makeToast(str, duration: 1.5, position: CSToastPositionBottom, style: style)
        UIApplication.shared.keyWindow!.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIApplication.shared.keyWindow!.isUserInteractionEnabled = true
        }
    }

    //MARK:-设置自定义色值颜色
    class func DEF_HEXColorA(rgbValue:Int, a:Double) ->UIColor!{
        return UIColor.init(red: CGFloat(((Float)((Int(rgbValue) & 0xFF0000) >> 16))/255.0), green:CGFloat(((Float)((Int(rgbValue) & 0xFF00) >> 8))/255.0), blue:CGFloat(((Float)(Int(rgbValue) & 0xFF))/255.0), alpha:CGFloat(a))
    }
    
    //MARK:-提示文字
    class func DEF_ShowHUDAndActivity(str:String) ->(){
        let hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated:true)
        hud?.mode = MBProgressHUDMode.indeterminate
        hud?.color = UIColor.init(red: 222/255.0, green: 224/255.0, blue: 226/255.0, alpha: 1)
        hud?.labelColor = UIColor.init(red: 64/255.0, green: 64/255.0, blue: 64/255.0, alpha: 1)
        hud?.activityIndicatorColor = UIColor.black
        hud?.labelFont = UIFont.systemFont(ofSize: 13)
        if str.count > 0 {
            hud?.labelText = str
        }else{
            hud?.labelText = "  加载中...  "
        }
    }
    
    //MARK:-隐藏提示文字
    class func DEF_HidenHUDAndActivity() ->(){
        MBProgressHUD.hideAllHUDs(for: UIApplication.shared.keyWindow!, animated: true)
    }

    
    class func callTel(tel:String){
        UIApplication.shared.open(NSURL(string :"tel://"+"\(tel)")! as URL, options: [:], completionHandler: nil)
    }
    
    // 日期字符串转化为Date类型
    // string: 日期字符串
    // dateFormat: 格式化样式，默认为“yyyy/MM/dd HH:mm:ss”
    // Returns: Date类型
    class func stringConvertDate(string:String, dateFormat:String="yyyy/MM/dd HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: string)
        return date!
    }
    
    // Date类型转化为日期字符串
    // date: Date类型
    // dateFormat: 格式化样式默认“yyyy/MM/dd HH:mm:ss”
    // Returns: 日期字符串
    class func dateConvertString(date:Date, dateFormat:String="yyyy/MM/dd HH:mm:ss") -> String {
        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: date)
        return date.components(separatedBy: " ").first!
    }
    
    
    // 获取视频第一贞截图
    class func getImage(url: URL) -> UIImage {
        //获取网络视频
        let avAsset = AVURLAsset.init(url: url)
        //生成视频截图
        let generator = AVAssetImageGenerator(asset: avAsset)
        generator.appliesPreferredTrackTransform = true
        let time = CMTimeMakeWithSeconds(0.0,preferredTimescale: 1)
        var actualTime:CMTime = CMTimeMake(value: 0,timescale: 0)
        let imageRef:CGImage = try! generator.copyCGImage(at: time, actualTime: &actualTime)
        let frameImg = UIImage(cgImage: imageRef)
        
        return frameImg
    }
}
