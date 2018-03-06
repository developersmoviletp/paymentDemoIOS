//
//  Result.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 14/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class Result: NSObject, Mappable {
    
    var result : String = ""
    var idResult : String = ""
    var descriptionValue : String = ""

    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        result		<- map["Result"]
        idResult		<- map["IdResult"]
        descriptionValue		<- map["Description"]
    }
    
}
