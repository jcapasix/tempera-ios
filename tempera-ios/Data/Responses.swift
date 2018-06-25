

import Foundation
import ObjectMapper

public class LoginResponse: Mappable  {
    
    var success:Bool?
    var user:User?
    var error:ErrorEntity?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.success <- map["success"]
        self.user   <- map["user"]
        self.error  <- map["error"]
    }
}

public class RegisterResponse: Mappable  {
    
    var success:Bool?
    var message:String?
    var error:ErrorEntity?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.success <- map["success"]
        self.message <- map["message"]
        self.error   <- map["error"]
    }
}


public class CreateResponse: Mappable  {
    
    var success:Bool?
    var message:String?
    var error:ErrorEntity?
    
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        self.success <- map["success"]
        self.message <- map["message"]
        self.error   <- map["error"]
    }
}
