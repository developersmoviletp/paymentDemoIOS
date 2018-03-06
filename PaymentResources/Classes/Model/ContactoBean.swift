
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

public class ContactoBean  :  Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var TipoPersona : String = ""
    @objc dynamic var Nombre : String = ""
    @objc dynamic var ApellidoPaterno : String = ""
    @objc dynamic var ApellidoMaterno : String = ""
    @objc dynamic var Telefono : String = ""
    @objc dynamic var OtroTelefono : String = ""
    @objc dynamic var Celular : String = ""
    @objc dynamic var CorreoElectronico : String = ""
    @objc dynamic var OtroCorreoElectronico : String = ""
    @objc dynamic var RFC : String = ""
    @objc dynamic var RazonSocial : String = ""
    @objc dynamic var MedioContacto : String = ""
    @objc dynamic var FechaNacimiento : String = ""

	required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		TipoPersona		<- map["TipoPersona"] 
		Nombre		<- map["Nombre"] 
		ApellidoPaterno		<- map["ApellidoPaterno"] 
		ApellidoMaterno		<- map["ApellidoMaterno"] 
		Telefono		<- map["Telefono"] 
		OtroTelefono		<- map["OtroTelefono"] 
		Celular		<- map["Celular"] 
		CorreoElectronico		<- map["CorreoElectronico"] 
		OtroCorreoElectronico		<- map["OtroCorreoElectronico"] 
		RFC		<- map["RFC"] 
		RazonSocial		<- map["RazonSocial"]
        MedioContacto        <- map["MedioContacto"]
		FechaNacimiento		<- map["FechaNacimiento"]
	}
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }

}
