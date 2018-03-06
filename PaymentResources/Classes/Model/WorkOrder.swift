//
//  WorkOrder.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 14/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class WorkOrder: NSObject, Mappable {
    
    var idOT : String = ""
    var oTAssigned : String = ""
    var statusOT : String = ""
    var subStatusOT : String = ""
    var idOperator : String = ""
    var schedulingDate : String = ""
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        idOT		<- map["IdOT"]
        oTAssigned		<- map["OTAsignada"]
        statusOT		<- map["StatusOT"]
        subStatusOT		<- map["EstadoOT"]
        idOperator		<- map["IdOperario"]
        schedulingDate		<- map["FechaAgendamiento"]
    }

}
