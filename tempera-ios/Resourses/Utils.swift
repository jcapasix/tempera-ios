

import Foundation
import UIKit

class Utils{
    
    static func addLogoToNavigation(navigationItem: UINavigationItem){
        let image = UIImage(named: "img-logo-nav")
        let logoClaro = UIImageView(image: image!)
        logoClaro.frame = CGRect(x: 0, y: 0, width: 69, height: 25)
        navigationItem.titleView = logoClaro;
    }
    
    static func showBasicAlert(title:String?, message:String?, view:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
    
    static func showCustomAlert(error:ErrorEntity?, view:UIViewController){
        let alert = UIAlertController(title: error?.title, message:error?.detail, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
    
    static func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    static func formatDate(date:Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yyyy hh:mm a"
        //formatter.dateStyle = .medium
        //formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "es_ES")
        return formatter.string(from: date)
    }
    
    static func callToPhone(phone:String){
        UIApplication.shared.openURL(NSURL(string: "tel://\(phone)")! as URL)
    }
    
    static func requiredHeight(labelText:String, width:CGFloat) -> CGFloat{
        
        let font = UIFont(name: "Roboto-Medium", size: 13.0)
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = labelText
        label.sizeToFit()
        
        return label.frame.height
    }
}
