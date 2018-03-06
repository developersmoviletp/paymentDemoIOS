
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

public class FirmaBean  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var DireccionFacturacion : DireccionFacturacionBean? = DireccionFacturacionBean()
    @objc dynamic var DatosAdicionales : DatosAdicionalesBean? = DatosAdicionalesBean()
    @objc dynamic var MetodoPago : MetodoPagoBean? = MetodoPagoBean()
    @objc dynamic var Referencias : ReferenciasBean? = ReferenciasBean()

	required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        
        self.DireccionFacturacion = DireccionFacturacionBean(value: self.DireccionFacturacion as Any)
        self.DireccionFacturacion		<- map["DireccionFacturacion"]
        
        self.DatosAdicionales = DatosAdicionalesBean(value: self.DatosAdicionales as Any)
        self.DatosAdicionales		<- map["DatosAdicionales"]
        
        self.MetodoPago = MetodoPagoBean(value: self.MetodoPago as Any)
        self.MetodoPago		<- map["MetodoPago"]
        
        self.Referencias = ReferenciasBean(value: self.Referencias as Any)
        self.Referencias		<- map["Referencias"]
        
	}

    override open static func primaryKey() -> String? {
        return "uuid"
    }
}
