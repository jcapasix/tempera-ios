//
//  HomeViewController.swift
//  tempera-ios
//
//  Created by Jordan Capa on 18/07/18.
//  Copyright © 2018 Jose Rojas. All rights reserved.
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController, UITabBarDelegate, UITabBarControllerDelegate {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempNameLabel: UILabel!
    
    @IBOutlet weak var tempMaxLabel: UILabel!
    
    var isCallService = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNotificationSetupCheck()
        self.tabBarController?.delegate = self
        
        
        let notification = UNMutableNotificationContent()
        notification.title = "Danger Will Robinson"
        notification.subtitle = "Something This Way Comes"
        notification.body = "I need to tell you something, but first read this."
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: notification, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.isCallService = true
        self.getData()
    }

    func initNotificationSetupCheck() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert])
        { (success, error) in
            if success {
                print("Permission Granted")
            } else {
                print("There was a problem!")
            }
        }
    }
    
    func getData(){
        RestApi.sharedInstance.getTemp { (temperatura, cultivo, error) in
            if(error == nil){
                self.tempLabel.text = "\(String(describing: temperatura?.value ?? 0))°"
                self.tempNameLabel.text = cultivo?.nombre
                self.tempMaxLabel.text = "Temp Máxima: \(String(describing: cultivo?.temperaturaMax ?? 0))°"
                
                if self.isCallService{
                    self.getData()
                }
            }
        }
    }
    
    
    // MARK: - UITabBarDelegate
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item")
        //print(item.badgeValue)
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if tabBarController.selectedIndex == 1 || tabBarController.selectedIndex == 2{
            self.isCallService = false
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
