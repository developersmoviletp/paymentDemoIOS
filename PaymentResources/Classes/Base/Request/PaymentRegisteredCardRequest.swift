//
//  PaymentRegisteredCardRequest.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 10/10/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class PaymentRegisteredCardRequest: BaseRequest {

    public var accountNumber : String?
    public var idCard : String?
    public var amount : String?
    public var cvv : String?
    
    public init(accountNumber : String, idCard : String, amount : String, cvv : String) {
        super.init()
        self.accountNumber = accountNumber
        self.idCard = idCard
        self.amount = amount
        self.cvv = cvv
    }
    
    public required init?(map: Map) {
        super.init()
    }
    
    public override func mapping(map : Map){
        super.mapping(map: map)
        accountNumber <- map["AccountNumber"]
        idCard <- map["IdCard"]
        amount <- map["Amount"]
        cvv <- map["Cvv"]
    }
    
}
