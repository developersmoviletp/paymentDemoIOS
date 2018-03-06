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
    
    var idCard : String = ""
    var cardNumber : String = ""
    var expirationMonth : String = ""
    var expirationYear : String = ""
    var name : String = ""
    var owner : String = ""
    var ccType : String = ""

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

