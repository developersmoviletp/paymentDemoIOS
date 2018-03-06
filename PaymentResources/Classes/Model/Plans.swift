//
//  Plans.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 23/10/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper
public class Plans: NSObject,Mappable {
   
    var planId : String?
    var planName : String?
    var comentary : String?
    var amountPP : String?
    var amountL : String?
    var internetMbps : String?
    var tvChannels : String?
    var hdChannels : String?
    var telephoneLines : String?
    var planDetail : String?
    var imgPlan2 : String?
    var imgPromo : String?
    var imPlan : String?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        planId <- map["IdPlan"]
        planName <- map["NombrePlan"]
        comentary <- map["Comentario"]
        amountPP <- map["PrecioProntoPago"]
        amountL <- map["PrecioLista"]
        internetMbps <- map["InternetMbps"]
        tvChannels <- map["CanalesTV"]
        hdChannels <- map["CanalesHD"]
        telephoneLines <- map["TelefoniasLineas"]
        planDetail <- map["DetallePlan"]
        imgPlan2 <- map["URLSlsf"]
        imgPromo <- map["URLSlsfPromo"]
        imPlan <- map["URLApp"]
    }

}
