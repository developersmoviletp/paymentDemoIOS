//
//  Suburb.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 26/10/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

public class Suburb: NSObject, Mappable {
    
    @objc dynamic var id : String?
    @objc dynamic var name : String?
    @objc dynamic var suburb : String?
    @objc dynamic var city : String?
    @objc dynamic var key : String?
    @objc dynamic var cluster : String?
    @objc dynamic var delegation : String?
    @objc dynamic var state : String?
    @objc dynamic var stateEnId : String?
    @objc dynamic var stateTpId : String?
    @objc dynamic var delegationEnId : String?
    @objc dynamic var delegationTpId : String?
    @objc dynamic var idSource : String?
    @objc dynamic var idPopulationEn : String?
    @objc dynamic var idPopulationTP : String?
    @objc dynamic var idRegionEn : String?
    @objc dynamic var idRegionTP : String?
    @objc dynamic var limit : String?
    @objc dynamic var limit1 : String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        self.id                <- map["Id"]
        self.name                <- map["Nombre"]
        self.suburb               <- map["Colonia"]
        self.city                <- map["Ciudad"]
        self.key                <- map["Clave"]
        self.cluster                <- map["Cluster"]
        self.delegation                <- map["DelegacionMunicipio"]
        self.state                <- map["Estado"]
        self.stateEnId                <- map["IdEstadoEN"]
        self.stateTpId                <- map["IdEstadoTP"]
        self.delegationEnId                <- map["IdMunicipioEN"]
        self.delegationTpId                <- map["IdMunicipioTP"]
        self.idSource                <- map["idOrigen"]
        self.idPopulationEn                <- map["IdProblacionEN"]
        self.idPopulationTP                <- map["IdProblacionTP"]
        self.idRegionEn                <- map["IdRegionEN"]
        self.idRegionTP                <- map["IdRegionTP"]
        self.limit                <- map["Limite"]
        self.limit1                <- map["Limite1"]
    }
    
}

