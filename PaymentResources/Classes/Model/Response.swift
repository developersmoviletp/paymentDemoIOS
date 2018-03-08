//
//  Response.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 03/11/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class Response: NSObject, Mappable {
    public var code: String?
    public var mDescription : String?
    
    public func mapping(map: Map) {
        code <- map["code"]
        mDescription <- map["description"]
    }
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
}
