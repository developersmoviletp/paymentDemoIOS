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
    public var arrResult: ArrResult?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    override public func mapping(map: Map) {
        arrResult <- map["arrResult"]
    }
}

public class ArrResult: NSObject,Mappable{
    
    public var idResult: Int?
    public var result: Int?
    public var resultDescription: String?
    public var arrDatosFactura : ArrDatosFactura?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        idResult <- map["idResult"]
        result <- map["result"]
        resultDescription <- map["resultDescription"]
        arrDatosFactura <- map["arrDatosFactura"]
    }
}

public class ArrDatosFactura: NSObject, Mappable{
    public var totalPayable: String?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        totalPayable <- map["totalPagar"]
    }
}
