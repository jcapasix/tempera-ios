

import Foundation
import ObjectMapper

class User: Mappable{
    
    var id:Int?
    var username:String?
    var token:String?
    
    init(id:Int?, username:String?, token:String?) {
        self.id = id
        self.username = username
        self.token = token
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.id         <- map["_id"]
        self.username   <- map["username"]
        self.token      <- map["token"]
    }
}
