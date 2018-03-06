
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

public class DireccionBean  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var zipCode : String = ""
    @objc dynamic var colony : String = ""
    @objc dynamic var delegation : String = ""
    @objc dynamic var city : String = ""
    @objc dynamic var state : String = ""
    @objc dynamic var street : String = ""
    @objc dynamic var noExt : String = ""
    @objc dynamic var noInt : String = ""
    @objc dynamic var betweenStreets : String = ""
    @objc dynamic var ReferenciaUrbana : String = ""
    @objc dynamic var authorizationWhitoutCoverage : String = ""
    @objc dynamic var cluster : String = ""
    @objc dynamic var place : String = ""
    @objc dynamic var district : String = ""
    @objc dynamic var feasibility : String = ""
    @objc dynamic var feasible : String = ""
    @objc dynamic var typeCoverage : String = ""
    @objc dynamic var region : String = ""
    @objc dynamic var idRegion : String = ""
    @objc dynamic var zoneValue : String = ""
    @objc dynamic var latitude : String = ""
    @objc dynamic var longitude : String = ""
    
    
	required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		zipCode		<- map["CodigoPostal"]
		colony		<- map["Colonia"]
		delegation		<- map["Delegacion"]
		city		<- map["Ciudad"]
		state		<- map["Estado"]
		street		<- map["Calle"]
		noExt		<- map["NumeroExterior"]
		noInt		<- map["NumeroInterior"]
		betweenStreets		<- map["EntreCalles"]
		ReferenciaUrbana		<- map["ReferenciaUrbana"] 
		authorizationWhitoutCoverage		<- map["AutorizacionSinCobertura"]
		cluster		<- map["Cluster"]
		place		<- map["Plaza"]
		district		<- map["Distrito"]
		feasibility		<- map["Factibilidad"]
		feasible		<- map["Factible"]
		typeCoverage		<- map["TipoCobertura"]
		region		<- map["Region"]
		idRegion		<- map["RegionId"]
        zoneValue		<- map["zona"]
        latitude		<- map["Latitude"]
        longitude		<- map["Longitude"]
	}
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }

}
