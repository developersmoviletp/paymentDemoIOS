//
//  LastBillBalance.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 03/11/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class LastBillBalance: NSObject, Mappable {
    public var totalPlay : Int?
    public var paymentDeadLine : String?
    public var totalPayDiscount : Int?
    public var earlyPaymentDeadline : String?
    public var cuOffData : String?
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        totalPlay <- map["totalPay"]
        paymentDeadLine <- map["endT"]
        totalPayDiscount <- map["totalPaydiscount"]
        earlyPaymentDeadline <- map["endTDiscount"]
        cuOffData <- map["courtT"]
    }
}
