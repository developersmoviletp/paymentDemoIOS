//
//  ArrFamily.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 21/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

open class ArrFamily: NSObject, Mappable {
    
    var idFamily : String = ""
    var nameFamily : String = ""
    var arrPlan : [ArrPlan] = []
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        idFamily		<- map["IdFamilia"]
        nameFamily		<- map["NombreFamilia"]
        arrPlan		<- map["ArrPlan"]
    }

}
