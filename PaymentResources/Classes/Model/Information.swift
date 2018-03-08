//
//  Information.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 21/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class Information: NSObject, Mappable {
    
    public var type : String = ""
    
    override init() {
        
    }
    
    init(type : String) {
        super.init()
        self.type = type
    }
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        type		<- map["Tipo"]
    }

}
