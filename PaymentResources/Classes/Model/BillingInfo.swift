//
//  BillingInfo.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 03/11/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

open class BillingInfo: NSObject, Mappable{
    public var lastBillBalance: LastBillBalance?
    
    required convenience  public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        lastBillBalance <- map["LastBillBalance"]
    }
    
}
