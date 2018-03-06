
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

public class SaleReleaseBean  : Object, Mappable  {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var typePlain : TipoPlanBean? = TipoPlanBean()
    @objc dynamic var plainBean : ArrPlanBean? = ArrPlanBean()
//    var addonServicesBean : List<ArrServiciosAdicionales> = List<ArrServiciosAdicionales>()
//    var addonPromoBean : List<ArrPromocionesPlan> = List<ArrPromocionesPlan>()
//    var arrIncludeServices : List<ArrServiciosIncluidos> = List<ArrServiciosIncluidos>()
    var arrAddonProd : List<ArrProductosAdicionales> = List<ArrProductosAdicionales>()

	required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        
        var objTypePlan = TipoPlanBean(value: typePlain as Any)
        objTypePlan		<- map["typePlain"]
        
        var objPlainBean = ArrPlanBean(value: plainBean as Any)
        objPlainBean		<- map["plainBean"]
		 
//        let objAddonServicesBean = List<ArrServiciosAdicionales>()
//        for item in addonServicesBean{
//            objAddonServicesBean.append(ArrServiciosAdicionales(value: item as Any))
//        }
//        self.addonServicesBean = objAddonServicesBean
//        self.addonServicesBean        <- map["addonServicesBean"]
        
//        let objAddonPromoBean = List<ArrPromocionesPlan>()
//        for item in addonPromoBean{
//            objAddonPromoBean.append(ArrPromocionesPlan(value: item as Any))
//        }
//        self.addonPromoBean = objAddonPromoBean
//        self.addonPromoBean        <- map["addonPromoBean"]
        
//        let objArrIncludeServices = List<ArrServiciosIncluidos>()
//        for item in arrIncludeServices{
//            objArrIncludeServices.append(ArrServiciosIncluidos(value: item as Any))
//        }
//        self.arrIncludeServices = objArrIncludeServices
//        self.arrIncludeServices        <- map["arrIncludeServices"]
        
        let objArrAddonProd = List<ArrProductosAdicionales>()
        for item in arrAddonProd{
            objArrAddonProd.append(ArrProductosAdicionales(value: item as Any))
        }
        self.arrAddonProd = objArrAddonProd
		self.arrAddonProd		<- map["arrAddonProd"]
	}
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }

}
