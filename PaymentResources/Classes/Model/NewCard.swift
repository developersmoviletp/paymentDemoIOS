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

    public var name : String = ""
    public var lastName : String = ""
    public var secondLastName : String = ""
    public var cardNumber : String = ""
    public var expirationMonth : String = ""
    public var expirationYear : String = ""
    public var ccType : String = ""
    
    override init(){
    }
    
    
    public init(name : String, lastName : String, secondLastName : String, cardNumber : String, expirationMonth : String,
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
