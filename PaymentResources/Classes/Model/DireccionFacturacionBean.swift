
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

public class DireccionFacturacionBean : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var MismaDireccionInstalacion : String = ""
    @objc dynamic var FolioContrato : String = ""
    @objc dynamic var Calle : String = ""
    @objc dynamic var NumeroExterior : String = ""
    @objc dynamic var NumeroInterior : String = ""
    @objc dynamic var ColoniaCP : String = ""
    @objc dynamic var Colonia : String = ""
    @objc dynamic var DelegacionMunicipio : String = ""
    @objc dynamic var Ciudad : String = ""
    @objc dynamic var Estado : String = ""
    @objc dynamic var CodigoPostal : String = ""


	required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		MismaDireccionInstalacion		<- map["MismaDireccionInstalacion"] 
		FolioContrato		<- map["FolioContrato"] 
		Calle		<- map["Calle"] 
		NumeroExterior		<- map["NumeroExterior"] 
		NumeroInterior		<- map["NumeroInterior"] 
		ColoniaCP		<- map["ColoniaCP"] 
		Colonia		<- map["Colonia"] 
		DelegacionMunicipio		<- map["DelegacionMunicipio"] 
		Ciudad		<- map["Ciudad"] 
		Estado		<- map["Estado"] 
		CodigoPostal		<- map["CodigoPostal"] 
	}
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }

}
