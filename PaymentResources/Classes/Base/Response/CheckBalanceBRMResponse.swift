//
//  CheckBalanceBRMResponse.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 06/11/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class CheckBalanceBRMResponse: BaseResponse {
    var arrResult: ArrResult?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    override public func mapping(map: Map) {
        arrResult <- map["arrResult"]
    }
}

class ArrResult: NSObject,Mappable{
    
    var idResult: Int?
    var result: Int?
    var resultDescription: String?
    var arrDatosFactura : ArrDatosFactura?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        idResult <- map["idResult"]
        result <- map["result"]
        resultDescription <- map["resultDescription"]
        arrDatosFactura <- map["arrDatosFactura"]
    }
}

class ArrDatosFactura: NSObject, Mappable{
    var totalPayable: String?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        totalPayable <- map["totalPagar"]
    }
}
