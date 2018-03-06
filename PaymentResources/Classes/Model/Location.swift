//
//  Location.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 28/06/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class Location : NSObject, Mappable{
    
    var lat: Double?
    var lng: Double?
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        lat		<- map["lat"]
        lng		<- map["lng"]
    }
}
