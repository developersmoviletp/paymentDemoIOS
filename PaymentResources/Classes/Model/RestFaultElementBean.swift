//
//  RestFaultElementBean.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 24/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class RestFaultElementBean: NSObject, Mappable {
    
    public var summary : String = ""
    public var code : String = ""
    public var detail : String = ""
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        summary		<- map["summary"]
        code		<- map["code"]
        detail		<- map["detail"]
    }

}
