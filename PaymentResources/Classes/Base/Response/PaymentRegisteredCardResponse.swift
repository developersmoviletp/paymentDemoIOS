//
//  PaymentRegisteredCardResponse.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 10/10/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class PaymentRegisteredCardResponse: BaseResponse {

    public var resultValue : String!
    public var transactionNumber : String!
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    override public func mapping(map: Map) {
        self.resultValue     <- map["Result"]
        self.transactionNumber     <- map["TransactionNumber"]
    }
    
}
