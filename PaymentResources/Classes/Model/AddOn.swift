import UIKit
import ObjectMapper

open class AddOn: NSObject, Mappable {
    
    open var idAddOn : String?
    open var nameAddOn : String?
    open var price : String?
   
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map : Map){
        
        idAddOn <- map["IdCard"]
        nameAddOn <- map["CardNumber"]
        price <- map["ExpirationMonth"]
    }
}
