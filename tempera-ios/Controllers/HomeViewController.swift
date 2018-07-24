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
    @IBOutlet weak var tempMinLabel: UILabel!
    
    var isCallService = true
    var TempNow = 0
    var TempBand = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNotificationSetupCheck()
        //self.mostrarNotificacion()
        self.tabBarController?.delegate = self
        UNUserNotificationCenter.current().delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.isCallService = true
        self.getData()
    }
    
    func getData(){
        RestApi.sharedInstance.getTemp { (temperatura, cultivo, error) in
            if(error == nil){
                self.tempLabel.text = "\(String(describing: temperatura?.value ?? 0))°"
                self.tempNameLabel.text = cultivo?.nombre
                self.tempMaxLabel.text = "Temp Máxima: \(String(describing: cultivo?.temperaturaMax ?? 0))°"
                self.tempMinLabel.text = "Temp Mínima: \(String(describing: cultivo?.temperaturaMin ?? 0))°"
                
                self.TempNow = (temperatura?.value)!
                
                if (((self.TempNow > (cultivo?.temperaturaMax)!) || (self.TempNow < (cultivo?.temperaturaMin)!)) &&      (self.TempNow != self.TempBand)){
                    
                    if(self.TempNow > (cultivo?.temperaturaMax)!){
                        self.mostrarNotificacion(cultivo, temperatura, "Máxima")
                    }
                    else{
                        self.mostrarNotificacion(cultivo, temperatura, "Mínima")
                    }
                    
                    
                    self.TempBand = self.TempNow
                    print("mostrarNotificacion ---> ")
                }
                
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
    
    
    // MARK: - Private Methods
    
    
    private func initNotificationSetupCheck() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert])
        { (success, error) in
            if success {
                print("Permission Granted")
            } else {
                print("There was a problem!")
            }
        }
    }
    

    private func mostrarNotificacion(_ cultivo:Cultivo?, _ temp:Temperatura?, _ max:String?) {
        // Create Notification Content
        let notificationContent = UNMutableNotificationContent()
        
        // Configure Notification Content
        notificationContent.title = "Alerta"
        notificationContent.subtitle = "Temperatura - \(String(describing: max ?? "")) \(cultivo?.nombre! ?? "")"
        
        if (max == "Máxima"){
            notificationContent.body = "La temperatura Máxima ha superado el límite."
        }
        else{
            notificationContent.body = "La temperatura Mínima está por debajo del límite"
        }
        
        
        // Add Trigger
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
        
        // Create Notification Request
        let notificationRequest = UNNotificationRequest(identifier: "cocoacasts_local_notification", content: notificationContent, trigger: notificationTrigger)
        
        // Add Request to User Notification Center
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
            }
            else{
                RestApi.sharedInstance.createReporte(cultivo: (cultivo?.id)!, temp: (temp?.id)!, completion: { (true, message, error) in
                    print(message)
                })
            }
        }
    }

}


extension HomeViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
    }
}
