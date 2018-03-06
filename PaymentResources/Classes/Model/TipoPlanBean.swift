
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

public class TipoPlanBean  : Object, Mappable {
    
    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var tipo : String?

	required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		tipo		<- map["Tipo"]
	}
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }
}
