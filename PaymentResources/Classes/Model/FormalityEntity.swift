
//
//  ArrServicesAdditionals.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel García Aldynamic varado on 12/20/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

public class FormalityEntity : BaseRealmRequest {

//    dynamic var result : Result?
    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var Prospecto : ProspectoBean? = ProspectoBean()
    @objc dynamic var saleRelease : SaleReleaseBean? = SaleReleaseBean()
    @objc dynamic var loginBean : EncryptedLoginBean? = EncryptedLoginBean()
    @objc dynamic var isUsedIdAsProof : Bool = false
    @objc dynamic var totalPriceList : Double = 0.0
    @objc dynamic var totalPriceSoonPayment : Double = 0.0
    
    var addonsServices : List<NameData> = List<NameData>()
	var imagenes = List<Imagen>()

	required convenience public init?(map: Map) {
        self.init()
    }

    public override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.loginBean = EncryptedLoginBean(value: self.loginBean as Any)
        self.loginBean		<- map["Login"]
        
        self.Prospecto = ProspectoBean(value: self.Prospecto as Any)
        self.Prospecto		<- map["Prospecto"]
	}
    
    public override static func primaryKey() -> String? {
        return "uuid"
    }

}
