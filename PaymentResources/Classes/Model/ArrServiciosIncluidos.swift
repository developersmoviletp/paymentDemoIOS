
//
//  ArrServicesAdditionals.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel García Aldynamic varado on 12/20/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit
import ObjectMapper

public class ArrServiciosIncluidos  : NSObject, Mappable {
    
    var uuid : String = UUID().uuidString
	var id : String = ""
	var nombre : String = ""
	var cantidadEquiposAutomaticos : String = ""
	var comentario : String = ""
	var maximoAgregar : String = ""
	var nombrecomercial : String = ""
	var nombreEditable : String = ""
	var planId : String = ""
	var precio : String = ""
	var seActiva : String = ""
	var seFactura : String = ""
	var servicioId : String = ""
	var sRVMode : String = ""
	var tipoServicio : String = ""
	var tipoTelefonia : String = ""
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
        
        self.arrProductosIncluidos         <- map["ArrProductosIncluidos"]
	}

}
