
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

open class ArrProductosAdicionales  : Object, Mappable, AdicionalesBean {
    
    public func getID() -> String {
        return id
    }
    public func getAdicionalType() -> Int {
        return AddicionalBeanType.PRODUCT_ADDITIONAL
    }
    public func getAdicionalName() -> String {
        return nombre
    }
    public func getPrecioBase() -> Double {
        return precioBase != "" ? Double(precioBase)! : 0
    }
    public func getPrecioProntoPago() -> Double {
        return precioProntoPago != "" ? Double(precioProntoPago)! : 0
    }
    public func getCantidad() -> Double {
        return cantidad != "" ? Double(cantidad)! : 0
    }
    public func getIVA() -> Double {
        return iVA != "" ? Double(iVA)! : 0
    }
    public func getIEPS() -> Double {
        return iEPS != "" ? Double(iEPS)! : 0
    }
    
    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var esProntoPago : String = ""
    @objc dynamic var id : String = ""
    @objc dynamic var nombre : String = ""
    @objc dynamic var agrupacionAddon : String = ""
    @objc dynamic var cantidadDN : String = ""
    @objc dynamic var cantidadTroncal : String = ""
    @objc dynamic var comentario : String = ""
    @objc dynamic var esAutomaticoCiudad : String = ""
    @objc dynamic var esCargoUnico : String = ""
    @objc dynamic var estatus : String = ""
    @objc dynamic var esVisible : String = ""
    @objc dynamic var idBrmArrear : String = ""
    @objc dynamic var idBrmCU : String = ""
    @objc dynamic var idBrmForward : String = ""
    @objc dynamic var iEPS : String = ""
    @objc dynamic var iVA : String = ""
    @objc dynamic var maximoAgregar : String = ""
    @objc dynamic var nombreEditable : String = ""
    @objc dynamic var planDescuentoId : String = ""
    @objc dynamic var plazo : String = ""
    @objc dynamic var precioBase : String = ""
    @objc dynamic var precioEditable : String = ""
    @objc dynamic var precioProntoPago : String = ""
    @objc dynamic var productoPadre : String = ""
    @objc dynamic var tipoProducto : String = ""
    @objc dynamic var tipoProductoTexto : String = ""
    @objc dynamic var idProducto : String = ""
    @objc dynamic var nameProducto : String = ""
    @objc dynamic var productoId : String = ""
    @objc dynamic var ciudad : String = ""
    @objc dynamic var velocidadSubida : String = ""
    @objc dynamic var velocidadBajada : String = ""
    @objc dynamic var tieneIPDinamica : String = ""
    @objc dynamic var tieneIPFija : String = ""
    @objc dynamic var tieneSTBAdicional : String = ""
    @objc dynamic var esCCTV : String = ""
    @objc dynamic var esWiFi : String = ""
    @objc dynamic var cantidad : String = ""
    @objc dynamic var estatusProducto : String = ""
    @objc dynamic var fechaInicio : String = ""
    @objc dynamic var fechaFin : String = ""
    @objc dynamic var comentarioProducto : String = ""
    @objc dynamic var priceApp : String = ""
    @objc dynamic var image : String = ""
    var ArrProductosConvivencia : List<ArrProductosConvivenciaBean> = List<ArrProductosConvivenciaBean>()

    var isSelected : Bool = false
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func attributeArray() -> [NSObject] {
        return Array(self.ArrProductosConvivencia)
    }
    
    public func attrbuteTitleSection() -> String {
        return self.agrupacionAddon
    }


    public func mapping(map: Map) {
         
		esProntoPago		<- map["EsProntoPago"]
		id		<- map["Id"]
		nombre		<- map["Nombre"]
		agrupacionAddon		<- map["AgrupacionAddon"]
		cantidadDN		<- map["CantidadDN"]
		cantidadTroncal		<- map["CantidadTroncal"]
		comentario		<- map["Comentario"]
		esAutomaticoCiudad		<- map["EsAutomaticoCiudad"]
		esCargoUnico		<- map["EsCargoUnico"]
		estatus		<- map["Estatus"]
		esVisible		<- map["EsVisible"]
		idBrmArrear		<- map["IdBrmArrear"]
		idBrmCU		<- map["IdBrmCU"]
		idBrmForward		<- map["IdBrmForward"]
		iEPS		<- map["IEPS"]
		iVA		<- map["IVA"]
		maximoAgregar		<- map["MaximoAgregar"]
		nombreEditable		<- map["NombreEditable"]
		planDescuentoId		<- map["PlanDescuentoId"]
		plazo		<- map["Plazo"]
		precioBase		<- map["PrecioBase"]
		precioEditable		<- map["PrecioEditable"]
		precioProntoPago		<- map["PrecioProntoPago"]
		productoPadre		<- map["ProductoPadre"]
		tipoProducto		<- map["TipoProducto"]
		tipoProductoTexto		<- map["TipoProductoTexto"]
		idProducto		<- map["IdProducto"]
		nameProducto		<- map["NameProducto"]
		productoId		<- map["ProductoId"]
		ciudad		<- map["Ciudad"]
		velocidadSubida		<- map["VelocidadSubida"]
		velocidadBajada		<- map["VelocidadBajada"]
		tieneIPDinamica		<- map["TieneIPDinamica"]
		tieneIPFija		<- map["TieneIPFija"]
		tieneSTBAdicional		<- map["TieneSTBAdicional"]
		esCCTV		<- map["EsCCTV"]
		esWiFi		<- map["EsWiFi"]
		cantidad		<- map["Cantidad"]
		estatusProducto		<- map["EstatusProducto"]
		fechaInicio		<- map["FechaInicio"]
		fechaFin		<- map["FechaFin"]
		comentarioProducto		<- map["ComentarioProducto"]
        priceApp	<- map["priceApp"]
        image    <- map["URLApp__c"]
        
        
        let objArrProductosConvivencia = List<ArrProductosConvivenciaBean>()
        for item in ArrProductosConvivencia{
            objArrProductosConvivencia.append(ArrProductosConvivenciaBean(value: item as Any))
        }
        self.ArrProductosConvivencia = objArrProductosConvivencia
		self.ArrProductosConvivencia		<- map["ArrProductosConvivencia"]
	}
    
    override open static func primaryKey() -> String? {
        return "uuid"
    }

}
