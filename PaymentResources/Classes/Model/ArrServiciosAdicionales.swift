
//
//  ArrServicesAdditionals.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel García Aldynamic varado on 12/20/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit
import ObjectMapper

public class ArrServiciosAdicionales  : NSObject, Mappable, AdicionalesBean {
    
    public func getID() -> String {
        return id
    }
    
    public func getAdicionalType() -> Int {
        return AddicionalBeanType.SERVICE
    }
    
    public func getAdicionalName() -> String {
        return nombre
    }
    
    public func getPrecioBase() -> Double {
        return 0
    }
    public func getPrecioProntoPago() -> Double {
        return 0
    }
    public func getCantidad() -> Double {
        return 0
    }
    public func getIVA() -> Double {
        return 0
    }
    public func getIEPS() -> Double {
        return 0
    }

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var id : String = ""
    @objc dynamic var nombre : String = ""
    @objc dynamic var cantidadEquiposAutomaticos : String = ""
    @objc dynamic var comentario : String = ""
    @objc dynamic var maximoAgregar : String = ""
    @objc dynamic var nombrecomercial : String = ""
    @objc dynamic var nombreEditable : String = ""
    @objc dynamic var planId : String = ""
    @objc dynamic var precio : String = ""
    @objc dynamic var seActiva : String = ""
    @objc dynamic var seFactura : String = ""
    @objc dynamic var servicioId : String = ""
    @objc dynamic var sRVMode : String = ""
    @objc dynamic var tipoServicio : String = ""
    @objc dynamic var tipoTelefonia : String = ""
    @objc dynamic var priceApp : String = ""
    @objc dynamic var image : String = ""
    var arrProductosIncluidos : [ArrProductosIncluido] = []

    required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        id		<- map["Id"]
		nombre		<- map["Nombre"]
		cantidadEquiposAutomaticos		<- map["CantidadEquiposAutomaticos"]
		comentario		<- map["Comentario"]
		maximoAgregar		<- map["MaximoAgregar"]
		nombrecomercial		<- map["Nombrecomercial"]
		nombreEditable		<- map["NombreEditable"]
		planId		<- map["PlanId"]
		precio		<- map["Precio"]
		seActiva		<- map["SeActiva"]
		seFactura		<- map["SeFactura"]
		servicioId		<- map["ServicioId"]
		sRVMode		<- map["SRV_Mode"]
		tipoServicio		<- map["TipoServicio"]
		tipoTelefonia		<- map["TipoTelefonia"]
        priceApp	<- map["priceApp"]
        image    <- map["ImgIconoApp"]
        
        arrProductosIncluidos    <- map["ArrProductosIncluidos"]
	}


}
