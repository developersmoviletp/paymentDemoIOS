//
//  LoginBean.swift
//  VentasTotalPlayiOS
//
//  Created by Jorge Hdez Villa on 07/02/17.
//  Copyright © 2017 TotalPlay. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

public class EncryptedLoginBean: Object, Mappable {

    @objc public dynamic var uuid : String = UUID().uuidString
    @objc public dynamic var user : String = "pU5IFduWKuA="
    @objc public dynamic var password : String = "10qnrC9ZB4Pq7IaUOTqu3g=="
    @objc public dynamic var ip : String = "p/ByNk8ng6S/bIgFpeCitg=="
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        user		<- map["User"]
        password		<- map["Password"]
        ip		<- map["Ip"]
    }
    
    func toCopy() -> EncryptedLoginBean {
        return EncryptedLoginBean(value: self as Any)
    }
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }

}
