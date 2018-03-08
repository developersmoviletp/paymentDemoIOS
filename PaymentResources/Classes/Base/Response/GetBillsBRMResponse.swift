//
//  GetBillsBRMResponse.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 03/11/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetBillsBRMResponse: BaseResponse {
    public var response: Response?
    public var billingInfo: BillingInfo?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    override public func mapping(map: Map) {
        response <- map["Response"]
        billingInfo <- map["BillInfo"]
    }

}



