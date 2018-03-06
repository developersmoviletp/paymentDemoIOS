
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

public class MetodoPagoBean  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var Metodo : String = ""
    @objc dynamic var TipoTarjeta : String = ""
    @objc dynamic var NombreTitular : String = ""
    @objc dynamic var ApellidoPaternoTitular : String = ""
    @objc dynamic var ApellidoMaternoTitular : String = ""
    @objc dynamic var NumeroTarjeta : String = ""
    @objc dynamic var VencimientoMes : String = ""
    @objc dynamic var VencimientoAnio : String = ""

	required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		Metodo		<- map["Metodo"] 
		TipoTarjeta		<- map["TipoTarjeta"] 
		NombreTitular		<- map["NombreTitular"] 
		ApellidoPaternoTitular		<- map["ApellidoPaternoTitular"] 
		ApellidoMaternoTitular		<- map["ApellidoMaternoTitular"] 
		NumeroTarjeta		<- map["NumeroTarjeta"] 
		VencimientoMes		<- map["VencimientoMes"] 
		VencimientoAnio		<- map["VencimientoAnio"] 
	}

    override public static func primaryKey() -> String? {
        return "uuid"
    }
    
}
