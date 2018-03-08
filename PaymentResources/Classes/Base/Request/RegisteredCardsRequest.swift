//
//  RegisteredCardsRequest.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 17/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class RegisteredCardsRequest: BaseRequest {
    
    public var accountNumber : String?
    
    public init(accountNumber : String) {
        super.init()
        self.accountNumber = accountNumber
    }
    
    public required init?(map: Map) {
        super.init()
    }
    
    public override func mapping(map : Map){
        super.mapping(map: map)
        accountNumber <- map["AccountNumber"]
    }

}
