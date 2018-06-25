

import Foundation
import UIKit

extension UIView{
    
    func asRounded(_ cornerRadius:Float){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = CGFloat(cornerRadius);
    }
    
    func asCircle(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width / 2;
    }
    
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}


extension UITextField{
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    func setBorderError(){
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.red.cgColor
    }
    func hiddeBorder(){
        self.layer.borderWidth = 0.0
    }
    
}

extension String{
    func stringDateToString() -> String{
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
    
        let date = formatter.date(from: self)
        
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "yyyy/MM/dd"
        
        return formatter.string(from: date!)
    }
}

extension UILabel {
    
    /// SwifterSwift: Initialize a UILabel with text
    public convenience init(text: String?) {
        self.init()
        self.text = text
    }
    
    /// SwifterSwift: Required height for a label
    public var requiredHeight: CGFloat {
        let label = UILabel(frame: self.bounds)
        label.numberOfLines = self.numberOfLines
        label.lineBreakMode = self.lineBreakMode
        label.font = self.font
        label.text = self.text
        label.sizeToFit()
        return label.frame.size.height
    }
    
}

