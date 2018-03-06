//
//  ResultBean.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel García Aldynamic varado on 12/20/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

public class ResultBean: Object, Mappable {

    @objc dynamic  var result : String = ""
    @objc dynamic  var idResult : String = ""
    @objc dynamic  var descript : String = ""
    
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        result           <- map["Result"]
        idResult           <- map["IdResult"]
        descript           <- map["Description"]
    }
    
}
