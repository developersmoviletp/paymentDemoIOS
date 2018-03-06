//
//  ArrPlan.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 21/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

open class ArrPlan: NSObject, Mappable {
    
    var planId : String = ""
    var planName : String = ""
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        planId		<- map["IdPlan"]
        planName		<- map["NombrePlan"]
    }

}
