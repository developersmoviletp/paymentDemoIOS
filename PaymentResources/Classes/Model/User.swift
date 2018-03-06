//
//  User.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 20/09/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

open class User: Object {
    
    @objc dynamic var accountNumber : String = ""
    
    convenience init(accountNumber : String) {
        self.init()
        self.accountNumber = accountNumber
    }

    override open class func primaryKey() -> String {
        return "accountNumber"
    }
    
}
