//
//  PredictionAddress.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 27/06/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class Terms : NSObject, Mappable{
    
    var offset: String?
    var value: String?

    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        offset		<- map["offset"]
        value		<- map["value"]
    }
}
