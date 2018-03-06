//
//  ArrPlanBean.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel García Aldynamic varado on 12/20/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

open class ArrPlanBean: Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var id_plan : String?
    @objc dynamic var name_plan : String?
    @objc dynamic var type_coverage : String?
    @objc dynamic var type_provisioning : String?
    @objc dynamic var type_billing : String?
    @objc dynamic var comment : String?
    @objc dynamic var allow_discount_rent : String?
    @objc dynamic var allow_discount_unique_charge : String?
    @objc dynamic var subtype_oportunity : String?
    @objc dynamic var tm_code_arrear : String?
    @objc dynamic var tm_code_fwd : String?
    
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
         
        self.id_plan                <- map["IdPlan"]
        self.name_plan    <- map["NombrePlan"]
        self.type_coverage   <- map["TipoCobertura"]
        self.type_provisioning   <- map["TipoAprovisionamiento"]
        self.type_billing   <- map["TipoFacturacion"]
        self.comment   <- map["Comentario"]
        self.allow_discount_rent   <- map["PemiteDescuentoRenta"]
        self.allow_discount_unique_charge   <- map["PermiteDescuentoCargoUnico"]
        self.subtype_oportunity   <- map["SubtipoOportunidad"]
        self.tm_code_arrear   <- map["TmcodeArrear"]
        self.tm_code_fwd   <- map["TmcodeFwd"]
    }
    
    override open static func primaryKey() -> String? {
        return "uuid"
    }
    
}
