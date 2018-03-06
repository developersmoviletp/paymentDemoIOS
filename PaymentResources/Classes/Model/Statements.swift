//
//  Statements.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 14/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class Statements: NSObject, Mappable {
    
    var date : String = ""
    var balance : String = ""
    var url : String = ""
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        date		<- map["Date"]
        balance		<- map["Balance"]
        url		<- map["Url"]
    }

}
