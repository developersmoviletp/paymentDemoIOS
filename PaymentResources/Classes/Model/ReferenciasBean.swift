
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

public class ReferenciasBean  : Object, Mappable  {

    @objc dynamic var uuid : String = UUID().uuidString
    var Referido : List<ReferidoBean> = List<ReferidoBean>()

	required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        let objReferido = List<ReferidoBean>()
        for item in Referido {
            objReferido.append(ReferidoBean(value:item as Any))
        }
        self.Referido = objReferido
        self.Referido 		<- map["Referido"]
	}
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }

}
