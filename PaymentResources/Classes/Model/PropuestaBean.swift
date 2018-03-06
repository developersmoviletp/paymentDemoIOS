
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

public class PropuestaBean : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var Oferta : String = ""
    @objc dynamic var TipoPago : String = ""
    @objc dynamic var Cot_SitioPlan : CotSitioPlanBean? = CotSitioPlanBean()
    @objc dynamic var Cot_PlanPromocion : CotPlanPromocionBean? = CotPlanPromocionBean()
    var Cot_PlanServicio : List<CotPlanServicioBean> = List<CotPlanServicioBean>()
    
    required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		Oferta		<- map["Oferta"]
		TipoPago		<- map["TipoPago"]
        
        self.Cot_SitioPlan = CotSitioPlanBean(value: self.Cot_SitioPlan as Any)
        self.Cot_SitioPlan		<- map["Cot_SitioPlan"]
        
        self.Cot_PlanPromocion = CotPlanPromocionBean(value: self.Cot_PlanPromocion as Any )
        self.Cot_PlanPromocion		<- map["Cot_PlanPromocion"]
        
        var objCotPlanServicio = List<CotPlanServicioBean>()
        for item in Cot_PlanServicio {
            objCotPlanServicio.append(CotPlanServicioBean(value: item as Any))
        }
        self.Cot_PlanServicio = objCotPlanServicio
		self.Cot_PlanServicio		<- map["Cot_PlanServicio"]
        
        if map.mappingType == MappingType.toJSON {
            var objCotPlanServicio : [CotPlanServicioBean] = []
            for item in Cot_PlanServicio {
                objCotPlanServicio.append(CotPlanServicioBean(value: item as Any))
            }
            objCotPlanServicio <- map["Cot_PlanServicio"]
        }
	}

    override public static func primaryKey() -> String? {
        return "uuid"
    }
    
}
