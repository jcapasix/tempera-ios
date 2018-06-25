//
//  AppDelegate.swift
//  tempera-ios
//
//  Created by Jordan Capa on 13/06/18.
//  Copyright © 2018 Jordan Capa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        let isLogin = AuthManager.sharedInstance.isLogin()
//
//        if isLogin == true{
//            // implement home view controller
//            let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeTabBarController") as! UITabBarController
//            self.window?.rootViewController = homeViewController
//            self.window?.makeKeyAndVisible()
//
//        }else{
//            // implement register view controller
//            let userViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "userNavigationController") as! UINavigationController
//            self.window?.rootViewController = userViewController
//            self.window?.makeKeyAndVisible()
//        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }


}

