
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

public class CotPlanPromocionBean : Object, Mappable {

    var uuid : String = UUID().uuidString
    var DP_PromocionPlan : List<DPPromocionPlanBean> = List<DPPromocionPlanBean>()

    required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        
        let objDPPromocionPlan = List<DPPromocionPlanBean>()
        for item in DP_PromocionPlan{
            objDPPromocionPlan.append(DPPromocionPlanBean(value: item as Any))
        }
        self.DP_PromocionPlan = objDPPromocionPlan
		self.DP_PromocionPlan		<- map["DP_PromocionPlan"]
        
	}

    override public static func primaryKey() -> String? {
        return "uuid"
    }
}
