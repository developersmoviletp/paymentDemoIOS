//
//  Package.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 05/07/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class Package : NSObject, Mappable{
    
    var descriptionPackage: String = ""
    var id: String = ""
    var typePackage: String = ""
    var megasPackage: String = ""
    var listDescription:[DescriptionPackage] = []
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        descriptionPackage		<- map["description"]
        id		<- map["id"]
        typePackage		<- map["place_id"]
        megasPackage		<- map["place_id"]
        listDescription		<- map["terms"]
    }
}
