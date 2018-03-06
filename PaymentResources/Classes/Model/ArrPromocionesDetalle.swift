
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

open class ArrPromocionesDetalle  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var id : String = ""
    @objc dynamic var nombre : String = ""
    @objc dynamic var cATCanalVenta : String = ""
    @objc dynamic var cATCiudad : String = ""
    @objc dynamic var cATCluster : String = ""
    @objc dynamic var cATPlazo : String = ""
    @objc dynamic var codigoPostal : String = ""
    @objc dynamic var cATTipoPago : String = ""
    @objc dynamic var dPPromocion : String = ""
    @objc dynamic var estatus : String = ""

    required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		id		<- map["Id"]
		nombre		<- map["Nombre"]
		cATCanalVenta		<- map["CAT_CanalVenta"]
		cATCiudad		<- map["CAT_Ciudad"]
		cATCluster		<- map["CAT_Cluster"]
		cATPlazo		<- map["CAT_Plazo"]
		codigoPostal		<- map["CodigoPostal"]
		cATTipoPago		<- map["CAT_TipoPago"]
		dPPromocion		<- map["DP_Promocion"]
		estatus		<- map["Estatus"] 
	}

    override open static func primaryKey() -> String? {
        return "uuid"
    }
    
}
