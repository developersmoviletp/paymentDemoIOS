import UIKit
import ObjectMapper

open class Addons: NSObject, Mappable {
    
    var addonName : String = ""
    var addonPayment : String = ""
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        addonName		<- map["AddOn"]
        addonPayment		<- map["Price"]
    }

}
