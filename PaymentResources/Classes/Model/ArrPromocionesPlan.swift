
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

public class ArrPromocionesPlan  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var id : String = ""
    @objc dynamic var nombre : String = ""
    @objc dynamic var comentario : String = ""
    @objc dynamic var descripcion : String = ""
    @objc dynamic var plan : String = ""
    @objc dynamic var planCambioParrilla : String = ""
    @objc dynamic var promocion : String = ""
    @objc dynamic var estatus : String = ""
    @objc dynamic var plazo : String = ""
    @objc dynamic var estatusPromociones : String = ""
    @objc dynamic var comentarioPromocion : String = ""
    @objc dynamic var nombrePromocion : String = ""
    @objc dynamic var companiaId : String = ""
    @objc dynamic var esAutomatica : String = ""
    @objc dynamic var esPostVenta : String = ""
    @objc dynamic var estatusPromocion : String = ""
    @objc dynamic var esVentaNueva : String = ""
    @objc dynamic var fechaFin : String = ""
    @objc dynamic var fechaInicio : String = ""
    @objc dynamic var idPromocion : String = ""
    var arrPromocionesConvivencia : List<ArrPromocionesConvivencium> = List<ArrPromocionesConvivencium>()
    var arrPromocionesDetalle : List<ArrPromocionesDetalle> = List<ArrPromocionesDetalle>()
    var arrDPPromocionesServicioProducto : List<ArrDPPromocionesServicioProducto> = List<ArrDPPromocionesServicioProducto>()

    var isSelected : Bool = false
    
    required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		id		<- map["Id"]
		nombre		<- map["Nombre"]
		comentario		<- map["Comentario"]
		descripcion		<- map["Descripcion"]
		plan		<- map["Plan"]
		planCambioParrilla		<- map["PlanCambioParrilla"]
		promocion		<- map["Promocion"]
		estatus		<- map["Estatus"]
		plazo		<- map["Plazo"]
		estatusPromociones		<- map["EstatusPromociones"]
		comentarioPromocion		<- map["ComentarioPromocion"]
		nombrePromocion		<- map["NombrePromocion"]
		companiaId		<- map["CompaniaId"]
		esAutomatica		<- map["EsAutomatica"]
		esPostVenta		<- map["EsPostVenta"]
		estatusPromocion		<- map["EstatusPromocion"]
		esVentaNueva		<- map["EsVentaNueva"]
		fechaFin		<- map["FechaFin"]
		fechaInicio		<- map["FechaInicio"]
		idPromocion		<- map["IdPromocion"]
        
        let objArrPromocionesConvivencia = List<ArrPromocionesConvivencium>()
        for item in arrPromocionesConvivencia{
            objArrPromocionesConvivencia.append(ArrPromocionesConvivencium(value: item as Any))
        }
        self.arrPromocionesConvivencia = objArrPromocionesConvivencia
		self.arrPromocionesConvivencia   <- map["ArrPromocionesConvivencia"]
        
        let objArrPromocionesDetalle = List<ArrPromocionesDetalle>()
        for item in arrPromocionesDetalle{
            objArrPromocionesDetalle.append(ArrPromocionesDetalle(value: item as Any))
        }
        self.arrPromocionesDetalle = objArrPromocionesDetalle
		self.arrPromocionesDetalle		<- map["ArrPromocionesDetalle"]
        
        let objArrDPPromocionesServicioProducto = List<ArrDPPromocionesServicioProducto>()
        for item in arrDPPromocionesServicioProducto{
            objArrDPPromocionesServicioProducto.append(ArrDPPromocionesServicioProducto(value: item as Any))
        }
        self.arrDPPromocionesServicioProducto = objArrDPPromocionesServicioProducto
		self.arrDPPromocionesServicioProducto 		<- map["ArrDP_PromocionesServicioProducto"]
        
	}
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }

}
