//
//  BaseResponse.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez Villa on 09/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class BaseResponse: NSObject, Mappable {
    
    var resultObj : Result? = nil
    var result : String = ""
    var resultDescription : String = ""
    var idResult : String = ""
    var restFaultElement : RestFaultElementBean? = nil
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        self.result     <- map["Result"]
        if self.result == "" {
            self.result <- map["result"]
        }
        self.resultDescription <- map["ResultDescription"]
        
        self.idResult <- map["idresult"]
        self.resultObj  <- map["Result"]
        self.restFaultElement  <- map["RestFaultElement"]
    }

}
