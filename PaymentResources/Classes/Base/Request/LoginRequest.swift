//
//  LoginRequest.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez Villa on 09/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class LoginRequest: NSObject, Mappable {

    public var user : String?
    public var password : String?
    public var ip : String?
    public var versionAPP : String?
    
    override public init() {
        super.init()
    }
    
    public init(user: String, password: String, ip: String) {
        self.user = user
        self.password = password
        self.ip = ip
    }
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map : Map){
        user <- map["userId"]
        user <- map["User"]
        user <- map["UserId"]
        password <- map["password"]
        password <- map["Password"]
        ip <- map["ip"]
        ip <- map["Ip"]
        versionAPP <- map["VersionAPP"]
    }
    
}
