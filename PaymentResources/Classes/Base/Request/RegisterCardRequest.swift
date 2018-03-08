//
//  RegisterCardRequest.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 21/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class RegisterCardRequest: BaseRequest {
    
    public var accountNumber : String?
    public var newCard : NewCard?
    
    public init(accountNumber : String, newCard : NewCard) {
        super.init()
        self.accountNumber = accountNumber
        self.newCard = newCard
    }
    
    public required init?(map: Map) {
        super.init()
    }
    
    public override func mapping(map : Map){
        super.mapping(map: map)
        accountNumber <- map["AccountNumber"]
        newCard <- map["NewCard"]
    }
    
}
