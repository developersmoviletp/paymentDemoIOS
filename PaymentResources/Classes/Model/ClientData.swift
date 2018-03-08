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
    public var name: String?
    public var email: String?
    public var phone: String?
    public var zipCode: String?
    public var colony: String?
    
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
