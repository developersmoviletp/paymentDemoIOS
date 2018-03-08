//
//  UserPassIp.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 03/11/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class UserPassIp: NSObject, Mappable {
    public var userId: String?
    public var password: String??
    public var ip: String?
    
    init(userId: String, password: String ,ip : String){
        super.init()
        self.userId =  userId
        self.password = password
        self.ip = ip
    }
    
    public required init?(map: Map) {
        fatalError("init(map:) has not been implemented")
    }
    
    public func mapping(map: Map) {
        userId <- map["userId"]
        password <- map["password"]
        ip <- map["ip"]
    }

}
