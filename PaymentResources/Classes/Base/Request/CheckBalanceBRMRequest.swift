//
//  CheckBalanceBRMRequest.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 06/11/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class CheckBalanceBRMRequest: BaseRequest {
    public var accountNumber: String?

    public init(accountNumber: String){
        super.init()
        self.accountNumber =  accountNumber
    }
    
    public required  init?(map: Map) {
        fatalError("init(map:) has not been implemented")
    }
    
    override public func mapping(map: Map) {
        accountNumber <- map["ACCOUNT_NO"]
    }
}
