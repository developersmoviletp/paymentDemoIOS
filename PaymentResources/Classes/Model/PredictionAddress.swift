//
//  PredictionAddress.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 27/06/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class PredictionAddress : NSObject, Mappable{
    
    var description_: String?
    var id: String?
    var place_id: String?
    var terms:[Terms] = []
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        description_		<- map["description"]
        id		<- map["id"]
        place_id		<- map["place_id"]
        terms		<- map["terms"]
    }
}
