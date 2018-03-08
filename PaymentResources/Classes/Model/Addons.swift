import UIKit
import ObjectMapper

open class Addons: NSObject, Mappable {
    
    open var addonName : String = ""
    open var addonPayment : String = ""
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        addonName		<- map["AddOn"]
        addonPayment		<- map["Price"]
    }

}
