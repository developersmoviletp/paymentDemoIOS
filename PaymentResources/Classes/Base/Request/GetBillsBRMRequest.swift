//
//  GetBillsBRMRequest.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 03/11/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class GetBillsBRMRequest: BaseRequest {
    public var accountNumber: String?
    public var userPassIp: UserPassIp?
    
    public init(accountNumber: String, userPass:  UserPassIp){
        super.init()
        self.accountNumber =  accountNumber
        self.userPassIp = userPass
    }
    
    public required init?(map: Map) {
        fatalError("init(map:) has not been implemented")
    }
    
    override public func mapping(map: Map) {
        accountNumber <- map["accountNo"]
        userPassIp <- map["userPassIp"]
    }
}
