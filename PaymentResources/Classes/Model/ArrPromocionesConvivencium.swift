
//
//  ArrServicesAdditionals.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel García Aldynamic varado on 12/20/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

open class ArrPromocionesConvivencium  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var id : String = ""
    @objc dynamic var nombre : String = ""
    @objc dynamic var estatus : String = ""
    @objc dynamic var promocionPlanId : String = ""
    @objc dynamic var promocionExcId : String = ""

    required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		id		<- map["Id"]
		nombre		<- map["Nombre"]
		estatus		<- map["Estatus"]
		promocionPlanId		<- map["PromocionPlanId"]
		promocionExcId		<- map["PromocionExcId"]
	}

    override open static func primaryKey() -> String? {
        return "uuid"
    }
    
}
