//
//  BasicRequest.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez Villa on 09/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class BaseRequest: NSObject, Mappable {
    
    var login : LoginRequest?
    
    override init() {
        login = LoginRequest()
        login?.user = Strings.LOGIN_REQUEST_USER
        login?.password = Strings.LOGIN_REQUEST_PASSWORD
        login?.ip = Strings.LOGIN_REQUEST_IP
    }
    
    init(user: String, password: String){
        login = LoginRequest()
        login?.user = user
        login?.password = password
        login?.ip = "Ip11"
    }
    
    init(user: String, password: String, ip: String){
        login = LoginRequest()
        login?.user = user
        login?.password = password
        login?.ip = ip
    }
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map : Map){
        login <- map["Login"]
    }
    
}
