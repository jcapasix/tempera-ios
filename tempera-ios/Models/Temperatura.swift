//
//  Temperatura.swift
//  tempera-ios
//
//  Created by Jordan Capa on 18/07/18.
//  Copyright © 2018 Jose Rojas. All rights reserved.
//

import Foundation
import ObjectMapper


public class TemperaturaResponse: Mappable  {
    var success:Bool?
    var temperatura:Temperatura?
    var cultivo:Cultivo?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.success <- map["success"]
        self.temperatura <- map["temperatura"]
        self.cultivo <- map["cultivo"]
    }
}

class Temperatura: Mappable{
    
    var id:String?
    var value:Int?
    
    init(id:String?, value:Int?) {
        self.id = id
        self.value = value
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.id     <- map["_id"]
        self.value  <- map["value"]
    }
}

