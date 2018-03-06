//
//  BaseRealmRequest.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 30/10/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

open class BaseRealmRequest: Object, Mappable {



    required convenience public init?(map: Map) {
        self.init()
    }

    convenience init(user: String, password: String){
        self.init()
    }
    
    public func mapping(map: Map) {
        
    }
    
    
}
