import Foundation
import ObjectMapper

open class AdditionalServices: NSObject, Mappable{
    
    open var mainImageAdditional: String?
    open var titleImageAdditional: String?
    open var legendAdditional: String?
    
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        mainImageAdditional		<- map["description"]
        titleImageAdditional		<- map["id"]
        legendAdditional		<- map["place_id"]
    }
 
}
