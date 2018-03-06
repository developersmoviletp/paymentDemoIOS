
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

public class ReferidoBean  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var Nombre : String = ""
    @objc dynamic var ApellidoPaterno : String = ""
    @objc dynamic var ApellidoMaterno : String = ""
    @objc dynamic var Parentesco : String = ""
    @objc dynamic var Telefono : String = ""
    
    var isValid : Bool = false

    required convenience public init?(map: Map) {
        self.init()
    }
    
    

    public func mapping(map: Map) {
         
		Nombre		<- map["Nombre"] 
		ApellidoPaterno		<- map["ApellidoPaterno"] 
		ApellidoMaterno		<- map["ApellidoMaterno"] 
		Parentesco		<- map["Parentesco"] 
		Telefono		<- map["Telefono"] 
	}
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }

}
