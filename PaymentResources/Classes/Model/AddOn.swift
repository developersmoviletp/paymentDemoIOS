import UIKit
import ObjectMapper

open class AddOn: NSObject, Mappable {
    
    var idAddOn : String?
    var nameAddOn : String?
    var price : String?
   
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map : Map){
        
        idAddOn <- map["IdCard"]
        nameAddOn <- map["CardNumber"]
        price <- map["ExpirationMonth"]
    }
}