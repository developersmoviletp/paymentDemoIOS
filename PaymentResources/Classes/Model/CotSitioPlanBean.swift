
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

public class CotSitioPlanBean  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var DescuentoCargoUnico : String = ""
    @objc dynamic var DescuentoRenta : String = ""
    @objc dynamic var DN_Principal : String = ""
    @objc dynamic var DP_Plan : String = ""
    @objc dynamic var DP_DescuentoLimiteCargoUnico : String = ""
    @objc dynamic var DP_DescuentoLimiteRenta : String = ""
    @objc dynamic var EstatusActivacion : String = ""
    @objc dynamic var NombrePlan : String = ""
    @objc dynamic var PrecioProntoPago : String = ""
    @objc dynamic var Ticket : String = ""

    required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		DescuentoCargoUnico		<- map["DescuentoCargoUnico"] 
		DescuentoRenta		<- map["DescuentoRenta"] 
		DN_Principal		<- map["DN_Principal"] 
		DP_Plan		<- map["DP_Plan"] 
		DP_DescuentoLimiteCargoUnico		<- map["DP_DescuentoLimiteCargoUnico"] 
		DP_DescuentoLimiteRenta		<- map["DP_DescuentoLimiteRenta"] 
		EstatusActivacion		<- map["EstatusActivacion"] 
		NombrePlan		<- map["NombrePlan"] 
		PrecioProntoPago		<- map["PrecioProntoPago"] 
		Ticket		<- map["Ticket"] 
	}

    override public static func primaryKey() -> String? {
        return "uuid"
    }
    
}
