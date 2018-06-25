//
//  PELAuthManager.swift
//  Peloteros
//
//  Created by Jordan Capa on 28/12/17.
//  Copyright © 2017 JANAQ. All rights reserved.
//

import Foundation

class AuthManager{
    
    private static let _sharedInstance = AuthManager()
    
    private let userDefaults = UserDefaults.standard
        
    static var sharedInstance: AuthManager{
        return _sharedInstance
    }
    
    func isLogin()->Bool{
        
        guard Utils.isKeyPresentInUserDefaults(key: "isLogin") else{
            return false
        }
        if userDefaults.bool(forKey: "isLogin"){
            return true
        }
        else{
            return false
        }
    }
    
    func login(){
        userDefaults.set(true, forKey: "isLogin")
    }
    func logout(){
        userDefaults.set(false, forKey: "isLogin")
    }
}
