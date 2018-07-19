

import Foundation
import ObjectMapper


public class BasicResponse: Mappable  {
    var success:Bool?
    var message:String?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.success <- map["success"]
        self.message <- map["message"]
    }
}


public class CultivoResponse: Mappable  {
    var success:Bool?
    var cultivos:[Cultivo]?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.success <- map["success"]
        self.cultivos <- map["cultivos"]
    }
}

class Cultivo: Mappable{

    var id:String?
    var nombre:String?
    var temperaturaMax:Int?
    var temperaturaMin:Int?
    var fechaInicial:String?
    var fechaFinal:String?
    var active:Bool?
    
    init(id:String?, nombre:String?, temperaturaMax:Int?, temperaturaMin:Int?, fechaInicial:String?, fechaFinal:String?, active:Bool?) {
        self.id = id
        self.nombre = nombre
        self.temperaturaMax = temperaturaMax
        self.temperaturaMin = temperaturaMin
        self.fechaInicial = fechaInicial
        self.fechaFinal = fechaFinal
        self.active = active
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.id                <- map["_id"]
        self.nombre                <- map["nombre"]
        self.temperaturaMax   <- map["temperaturaMax"]
        self.temperaturaMin   <- map["temperaturaMin"]
        self.fechaInicial     <- map["fechaInicial"]
        self.fechaFinal       <- map["fechaFinal"]
        self.active       <- map["active"]
    }
}
