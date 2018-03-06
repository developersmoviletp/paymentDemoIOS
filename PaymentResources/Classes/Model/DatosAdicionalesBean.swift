
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

public class DatosAdicionalesBean : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var TipoIdentificacion : String = ""
    @objc dynamic var IdentificacionOficial : String = ""

    required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		TipoIdentificacion		<- map["TipoIdentificacion"] 
		IdentificacionOficial		<- map["IdentificacionOficial"] 
	}

    override public static func primaryKey() -> String? {
        return "uuid"
    }
    
}
