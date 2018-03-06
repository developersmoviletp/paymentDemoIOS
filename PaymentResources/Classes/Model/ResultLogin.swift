//
//  ResultLogin.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 07/09/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class ResultLogin: NSObject, Mappable {
    
    var accountNumber : String = ""
    var result : String = ""
    var idResult : String = ""
    var descriptionValue : String = ""
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        accountNumber		<- map["Account"]
        result		<- map["Result"]
        idResult		<- map["IdResult"]
        descriptionValue		<- map["Description"]
    }

}
