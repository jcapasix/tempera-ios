

import Foundation
import ObjectMapper


class ErrorEntity: Mappable{
    
    var title:String?
    var detail:String?
    
    init(title:String?, detail:String?) {
        self.title = title
        self.detail = detail
    }
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.title  <- map["title"]
        self.detail <- map["detail"]
    }
}
