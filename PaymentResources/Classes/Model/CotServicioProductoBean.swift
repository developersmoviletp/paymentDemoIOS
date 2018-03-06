
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

public class CotServicioProductoBean  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var Cantidad : String = ""
    @objc dynamic var CantidadDN : String = ""
    @objc dynamic var CantidadTroncal : String = ""
    @objc dynamic var Descuento : String = ""
    @objc dynamic var DP_Producto : String = ""
    @objc dynamic var DP_PromocionServicioProducto : String = ""
    @objc dynamic var DP_ServicioProducto : String = ""
    @objc dynamic var EsCargoUnico : String = ""
    @objc dynamic var EsDescuento : String = ""
    @objc dynamic var EsProductoAdicional : String = ""
    @objc dynamic var EsProntoPago : String = ""
    @objc dynamic var EsServicioRepetido : String = ""
    @objc dynamic var EstatusActivacion : String = ""
    @objc dynamic var EstatusActivacionDescripcion : String = ""
    @objc dynamic var FechaFin : String = ""
    @objc dynamic var FechaInicio : String = ""
    @objc dynamic var GeneraDNs : String = ""
    @objc dynamic var Impuesto2 : String = ""
    @objc dynamic var Impuesto1 : String = ""
    @objc dynamic var MontoImpuestos : String = ""
    @objc dynamic var NombreProducto : String = ""
    @objc dynamic var PrecioUnitario : String = ""
    @objc dynamic var PrecioUnitario_ProntoPago : String = ""
    @objc dynamic var PrecioUnitarioBase : String = ""
    @objc dynamic var ProductoPadre : String = ""
    @objc dynamic var TieneIPDinamica : String = ""
    @objc dynamic var TieneIPFija : String = ""
    @objc dynamic var TipoIp : String = ""
    @objc dynamic var TipoProducto : String = ""
    @objc dynamic var VelocidadBajada : String = ""
    @objc dynamic var VelocidadSubida : String = ""
    @objc dynamic var DP_PromocionPlan : String = ""
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    convenience init(arrProductoIncluido: ArrProductosIncluido) {
        self.init()
        Cantidad = arrProductoIncluido.cantidad
        Descuento = "0.0"
        DP_PromocionServicioProducto = ""
        DP_ServicioProducto = arrProductoIncluido.id
        EsCargoUnico = arrProductoIncluido.esCargoUnico
        EsDescuento = "false"
        EsProductoAdicional = "false"
        EsProntoPago = arrProductoIncluido.esProntoPago
        Impuesto2 = arrProductoIncluido.iEPS
        Impuesto1 = arrProductoIncluido.iVA
        NombreProducto = arrProductoIncluido.nameProducto
        PrecioUnitario = arrProductoIncluido.precioBase
        PrecioUnitario_ProntoPago = arrProductoIncluido.precioProntoPago
        PrecioUnitarioBase = arrProductoIncluido.precioBase
        ProductoPadre = arrProductoIncluido.productoPadre
        TipoProducto = arrProductoIncluido.tipoProducto
        DP_PromocionPlan = ""
    }
    
    convenience init(arrProductoAdicional: ArrProductosAdicionales) {
        self.init()
        Cantidad = arrProductoAdicional.cantidad
        Descuento = "0.0"
        DP_PromocionServicioProducto = ""
        DP_ServicioProducto = arrProductoAdicional.id
        EsCargoUnico = arrProductoAdicional.esCargoUnico
        Descuento = "false"
        EsProductoAdicional = "true"
        EsProntoPago = arrProductoAdicional.esProntoPago
        Impuesto2 = arrProductoAdicional.iEPS
        Impuesto1 = arrProductoAdicional.iVA
        NombreProducto = arrProductoAdicional.nameProducto
        PrecioUnitario = arrProductoAdicional.precioBase
        PrecioUnitario_ProntoPago = arrProductoAdicional.precioProntoPago
        PrecioUnitarioBase = arrProductoAdicional.precioBase
        ProductoPadre = arrProductoAdicional.productoPadre
        TipoProducto = arrProductoAdicional.tipoProducto
        DP_PromocionPlan = ""
    }
    
    

    public func mapping(map: Map) {
        Cantidad		<- map["Cantidad"]
        CantidadDN		<- map["CantidadDN"]
        CantidadTroncal		<- map["CantidadTroncal"]
        Descuento		<- map["Descuento"]
        DP_Producto		<- map["DP_Producto"]
        DP_PromocionServicioProducto		<- map["DP_PromocionServicioProducto"]
        DP_ServicioProducto		<- map["DP_ServicioProducto"]
        EsCargoUnico		<- map["EsCargoUnico"]
        EsDescuento		<- map["EsDescuento"]
        EsProductoAdicional		<- map["EsProductoAdicional"]
        EsProntoPago		<- map["EsProntoPago"]
        EsServicioRepetido		<- map["EsServicioRepetido"]
        EstatusActivacion		<- map["EstatusActivacion"]
        EstatusActivacionDescripcion		<- map["EstatusActivacionDescripcion"]
        FechaFin		<- map["FechaFin"]
        FechaInicio		<- map["FechaInicio"]
        GeneraDNs		<- map["GeneraDNs"]
        Impuesto2		<- map["Impuesto2"]
        Impuesto1		<- map["Impuesto1"]
        MontoImpuestos		<- map["MontoImpuestos"]
        NombreProducto		<- map["NombreProducto"]
        PrecioUnitario		<- map["PrecioUnitario"]
        PrecioUnitario_ProntoPago		<- map["PrecioUnitario_ProntoPago"]
        PrecioUnitarioBase		<- map["PrecioUnitarioBase"]
        ProductoPadre		<- map["ProductoPadre"]
        TieneIPDinamica		<- map["TieneIPDinamica"]
        TieneIPFija		<- map["TieneIPFija"]
        TipoIp		<- map["TipoIp"]
        TipoProducto		<- map["TipoProducto"]
        VelocidadBajada		<- map["VelocidadBajada"] 
        VelocidadSubida		<- map["VelocidadSubida"] 
        DP_PromocionPlan		<- map["DP_PromocionPlan"]
	}
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }

}
