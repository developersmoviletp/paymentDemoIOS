
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

public class ProspectoBean  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var PlazoContrato : String = "18"
    @objc dynamic var CuentaBRM : String = ""
    @objc dynamic var IdOportunidad : String = ""
    @objc dynamic var IdCuenta : String = ""
    @objc dynamic var IdCuentaFactura : String = ""
    @objc dynamic var IdContacto : String = ""
    @objc dynamic var IdCotizacion : String = ""
    @objc dynamic var IdSitio : String = ""
    @objc dynamic var Vendedor : VendedorBean? = VendedorBean()
    @objc dynamic var Direccion : DireccionBean? = DireccionBean()
    @objc dynamic var Contacto : ContactoBean? = ContactoBean()
    @objc dynamic var Propuesta : PropuestaBean? = PropuestaBean()
    @objc dynamic var Firma : FirmaBean? = FirmaBean()

	required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        
		CuentaBRM		<- map["CuentaBRM"]
		IdOportunidad		<- map["IdOportunidad"]
		IdCuenta		<- map["IdCuenta"]
		IdCuentaFactura		<- map["IdCuentaFactura"]
		IdContacto		<- map["IdContacto"]
		IdCotizacion		<- map["IdCotizacion"]
		IdSitio		<- map["IdSitio"]
        PlazoContrato		<- map["PlazoContrato"]
        
        self.Direccion = DireccionBean(value: self.Direccion as Any)
        self.Direccion		<- map["Direccion"]

        self.Vendedor = VendedorBean(value: self.Vendedor as Any)
        self.Vendedor		<- map["Vendedor"]
        
        self.Contacto = ContactoBean(value: self.Contacto as Any)
        self.Contacto		<- map["Contacto"]
        
        self.Propuesta = PropuestaBean(value: self.Propuesta as Any)
        self.Propuesta		<- map["Propuesta"]
        
        self.Firma = FirmaBean(value: self.Firma as Any)
        self.Firma		<- map["Firma"]
		
	}
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }


}
