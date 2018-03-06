//
//  NewCard.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 21/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class NewCard: NSObject, Mappable {

    var name : String = ""
    var lastName : String = ""
    var secondLastName : String = ""
    var cardNumber : String = ""
    var expirationMonth : String = ""
    var expirationYear : String = ""
    var ccType : String = ""
    
    override init(){
    }
    
    
    init(name : String, lastName : String, secondLastName : String, cardNumber : String, expirationMonth : String,
            expirationYear : String, ccType : String) {
        super.init()
        self.name = name
        self.lastName = lastName
        self.secondLastName = secondLastName
        self.cardNumber = cardNumber
        self.expirationMonth = expirationMonth
        self.expirationYear = expirationYear
        self.ccType = ccType
    }
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        name		<- map["Name"]
        lastName		<- map["LastName"]
        secondLastName		<- map["SecondLastName"]
        cardNumber		<- map["CardNumber"]
        expirationMonth		<- map["ExpirationMonth"]
        expirationYear		<- map["ExpirationYear"]
        ccType		<- map["CCTYPE"]
    }
    
}
