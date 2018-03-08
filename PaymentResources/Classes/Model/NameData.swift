//
//  NameData.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 24/11/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import RealmSwift
import Realm
import ObjectMapper

public class NameData: Object, Mappable {
    public func mapping(map: Map) {
        
    }
    
    @objc public dynamic var uuid : String = UUID().uuidString
    @objc public dynamic var name: String?
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public override static func primaryKey() -> String? {
        return "uuid"
    }
}
