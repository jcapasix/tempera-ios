//
//  Reporte.swift
//  tempera-ios
//
//  Created by Jordan Capa on 22/07/18.
//  Copyright © 2018 Jose Rojas. All rights reserved.
//

import Foundation
import ObjectMapper


public class ReporteResponse: Mappable  {
    var success:Bool?
    var reportes:[Reporte]?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.success <- map["success"]
        self.reportes <- map["reportes"]
    }
}

class Reporte: Mappable{
    var cultivo:Cultivo?
    var alertas:Int?
    var temperatura:Int?
    
    init(id:Int?, value:Int?) {
        self.alertas = id
        self.temperatura = value
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.cultivo     <- map["cultivo"]
        self.alertas     <- map["alertas"]
        self.temperatura  <- map["temperatura"]
    }
}
