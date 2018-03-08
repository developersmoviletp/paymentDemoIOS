//
//  Cards.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 04/07/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class Card: NSObject, Mappable {
    
    public var idCard : String = ""
    public var cardNumber : String = ""
    public var expirationMonth : String = ""
    public var expirationYear : String = ""
    public var name : String = ""
    public var owner : String = ""
    public var ccType : String = ""

    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map : Map){
        idCard <- map["IdCard"]
        cardNumber <- map["CardNumber"]
        expirationMonth <- map["ExpirationMonth"]
        expirationYear <- map["ExpirationYear"]
        owner <- map["Nombre"]
        ccType <- map["CCType"]
    }
    
}

