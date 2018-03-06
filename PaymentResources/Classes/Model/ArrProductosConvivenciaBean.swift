
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

open class ArrProductosConvivenciaBean  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var Id : String = ""
    @objc dynamic var Name : String = ""
    @objc dynamic var Comentario : String = ""
    @objc dynamic var Estatus : String = ""
    @objc dynamic var ProductoId : String = ""
    @objc dynamic var ProductoExcIncId : String = ""
    @objc dynamic var Tipo : String = ""

	required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		Id		<- map["Id"] 
		Name		<- map["Name"] 
		Comentario		<- map["Comentario"] 
		Estatus		<- map["Estatus"] 
		ProductoId		<- map["ProductoId"] 
		ProductoExcIncId		<- map["ProductoExcIncId"] 
		Tipo		<- map["Tipo"] 
	}
    
    override open static func primaryKey() -> String? {
        return "uuid"
    }


}
