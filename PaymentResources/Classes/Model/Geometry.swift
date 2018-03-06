//
//  Geometry.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 28/06/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class Geometry : NSObject, Mappable{
    var location: Location?
        
    public required convenience init?(map: Map) {
        self.init()
    }
        
    public func mapping(map: Map) {
        location		<- map["location"]
    }
}
