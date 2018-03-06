
//
//  ArrServicesAdditionals.swift
//  VentasTotalPlayiOS
//
//  Created by TotalPlay Aldynamic varado on 12/20/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit
import ObjectMapper 
import RealmSwift

public class DPPromocionPlanBean  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var Id : String = ""

    required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
		Id		<- map["Id"] 
	}
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }
    
}
