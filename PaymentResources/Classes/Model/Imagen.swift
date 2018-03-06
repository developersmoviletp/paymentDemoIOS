//
//  Imagen.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel Garcia Alvarado on 2/2/17.
//  Copyright © 2017 TotalPlay. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

public class Imagen: Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var image : String = ""
    @objc dynamic var thumbnail : String = ""
    @objc dynamic var name : String = ""
    @objc dynamic var type : String = ""
    let code = RealmOptional<Int>()
    @objc dynamic var opportunityId : String = ""
    @objc dynamic var brmAccount : String = ""
    @objc dynamic var contentType : String = "image/jpeg"
    @objc dynamic var syncStatus : String = SyncStatus.NOT_SYNCHRONIZED
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        opportunityId   <- map["OportunidadId"]
        brmAccount      <- map["CuentaBRM"]
        name            <- map["Nombre"]
        type            <- map["Type"]
        image           <- map["Body"]
        contentType     <- map["ContentType"]
    }
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }
}
