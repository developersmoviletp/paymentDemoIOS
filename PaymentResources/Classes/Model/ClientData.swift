//
//  ClientData.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 31/10/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class ClientData: NSObject, Mappable  {
    var name: String?
    var email: String?
    var phone: String?
    var zipCode: String?
    var colony: String?
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        name <- map["Name"]
        email <- map["Email"]
        phone <- map["Phone"]
        zipCode <- map["ZipCode"]
        colony <- map["Colony"]
    }
}
