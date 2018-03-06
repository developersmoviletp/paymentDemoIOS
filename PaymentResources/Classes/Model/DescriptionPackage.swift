//
//  DescriptionPackage.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 05/07/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class DescriptionPackage : NSObject, Mappable{
    
    var descriptionP: String?
    var id: String?
    var iconDescription: String?
   
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        descriptionP		<- map["description"]
        id		<- map["id"]
        iconDescription		<- map["place_id"]
    }
}
