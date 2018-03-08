import UIKit
import ObjectMapper

open class AddressComponent : NSObject, Mappable{
    
    open var long_name: String?
    open var short_name : String?
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        long_name		<- map["long_name"]
        short_name <- map["short_name"]
    }
}
