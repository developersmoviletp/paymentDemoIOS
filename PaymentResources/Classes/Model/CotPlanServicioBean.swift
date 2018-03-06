
//
//  ArrServicesAdditionals.swift
//  VentasTotalPlayiOS
//
//  Created by TotalPlay :v Aldynamic varado on 12/20/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

open class CotPlanServicioBean : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var CategoriaServicio : String = ""
    @objc dynamic var DN_Principal : String = ""
    @objc dynamic var DNsActivados : String = ""
    @objc dynamic var DP_PlanServicio : String = ""
    @objc dynamic var EsServicioAdicional : String = ""
    @objc dynamic var EstatusActivacion : String = ""
    @objc dynamic var IdExterno_ws : String = ""
    @objc dynamic var IpFijasActivadas : String = ""
    @objc dynamic var NombrePlan : String = ""
    @objc dynamic var NombreServicio : String = ""
    @objc dynamic var SRV_Mode : String = ""
    @objc dynamic var Tipo : String = ""
    @objc dynamic var DP_PromocionPlan : String = ""
    var Cot_ServicioProducto : List<CotServicioProductoBean> = List<CotServicioProductoBean>()

    required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		CategoriaServicio		<- map["CategoriaServicio"] 
		DN_Principal		<- map["DN_Principal"] 
		DNsActivados		<- map["DNsActivados"] 
		DP_PlanServicio		<- map["DP_PlanServicio"] 
		EsServicioAdicional		<- map["EsServicioAdicional"] 
		EstatusActivacion		<- map["EstatusActivacion"] 
		IdExterno_ws		<- map["IdExterno_ws"] 
		IpFijasActivadas		<- map["IpFijasActivadas"] 
		NombrePlan		<- map["NombrePlan"] 
		NombreServicio		<- map["NombreServicio"] 
		SRV_Mode		<- map["SRV_Mode"] 
		Tipo		<- map["Tipo"] 
		DP_PromocionPlan		<- map["DP_PromocionPlan"]
        
        let objCotServicioProducto = List<CotServicioProductoBean>()
        for item in Cot_ServicioProducto{
            objCotServicioProducto.append(CotServicioProductoBean(value: item as Any))
        }
        self.Cot_ServicioProducto = objCotServicioProducto
		self.Cot_ServicioProducto		<- map["Cot_ServicioProducto"]
        
        if map.mappingType == MappingType.toJSON {
            var objCotServicioProducto : [CotServicioProductoBean] = []
            for item in Cot_ServicioProducto{
                objCotServicioProducto.append(CotServicioProductoBean(value: item as Any))
            }
            objCotServicioProducto        <- map["Cot_ServicioProducto"]
        }
	}

    override open static func primaryKey() -> String? {
        return "uuid"
    }
    
}
