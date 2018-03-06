//
//  Feasibility.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 24/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class Feasibility: NSObject, Mappable {
    
    var feasible : String = ""
    var region : String = ""
    var regionId : String = ""
    var city : String = ""
    var district : String = ""
    var cluster : String = ""
    var zoneValue : String = ""
    var judgment : String = ""
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        feasible		<- map["Feasible"]
        region		<- map["Region"]
        regionId		<- map["RegionId"]
        city		<- map["City"]
        district		<- map["Distric"]
        cluster		<- map["Cluster"]
        zoneValue		<- map["Zone"]
        judgment		<- map["Criterio"]
    }

}
