//
//  ResultLocation.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 28/06/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//
import UIKit
import ObjectMapper

public class ResultLocation : NSObject, Mappable{
    
    var geometry: Geometry?
    var formattedAddress : [AddressComponent] = []
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        geometry		<- map["geometry"]
        formattedAddress <- map["address_components"]
    }
}
